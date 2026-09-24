// FoodBridge Front-End State & JWT Authentication Manager
window.FoodBridge = window.FoodBridge || {};

window.FoodBridge.TOKEN_KEY = 'foodBridge.jwt';
window.FoodBridge.USER_KEY = 'foodBridge.user';
window.FoodBridge.DONATIONS_KEY = 'foodBridge.donations';

// Token Management
window.FoodBridge.getToken = function () {
    return localStorage.getItem(window.FoodBridge.TOKEN_KEY) || sessionStorage.getItem(window.FoodBridge.TOKEN_KEY) || '';
};

window.FoodBridge.setToken = function (token, rememberMe = false, userInfo = null) {
    const storage = rememberMe ? localStorage : sessionStorage;
    const otherStorage = rememberMe ? sessionStorage : localStorage;
    otherStorage.removeItem(window.FoodBridge.TOKEN_KEY);
    otherStorage.removeItem(window.FoodBridge.USER_KEY);
    
    storage.setItem(window.FoodBridge.TOKEN_KEY, token);
    if (userInfo) {
        storage.setItem(window.FoodBridge.USER_KEY, JSON.stringify(userInfo));
    }
};

window.FoodBridge.getUser = function () {
    const raw = localStorage.getItem(window.FoodBridge.USER_KEY) || sessionStorage.getItem(window.FoodBridge.USER_KEY);
    if (!raw) return null;
    try {
        return JSON.parse(raw);
    } catch {
        return null;
    }
};

window.FoodBridge.clearToken = function () {
    localStorage.removeItem(window.FoodBridge.TOKEN_KEY);
    sessionStorage.removeItem(window.FoodBridge.TOKEN_KEY);
    localStorage.removeItem(window.FoodBridge.USER_KEY);
    sessionStorage.removeItem(window.FoodBridge.USER_KEY);
};

// Claims parsing
window.FoodBridge.getClaims = function () {
    const token = window.FoodBridge.getToken();
    if (!token) return null;
    try {
        const parts = token.split('.');
        if (parts.length !== 3) return null;
        let base64 = parts[1].replace(/-/g, '+').replace(/_/g, '/');
        while (base64.length % 4 !== 0) {
            base64 += '=';
        }
        const payload = decodeURIComponent(atob(base64).split('').map(function(c) {
            return '%' + ('00' + c.charCodeAt(0).toString(16)).slice(-2);
        }).join(''));
        return JSON.parse(payload);
    } catch (e) {
        console.error('Failed to parse JWT payload', e);
        return null;
    }
};

window.FoodBridge.getUserRole = function () {
    const claims = window.FoodBridge.getClaims();
    if (!claims) return '';
    const rawRole = claims['http://schemas.microsoft.com/ws/2008/06/identity/claims/role'] || 
                    claims['role'] || 
                    claims['Role'] || 
                    claims['roles'] || 
                    claims['Roles'] || '';
    if (Array.isArray(rawRole)) {
        return rawRole[0] ? String(rawRole[0]).trim() : '';
    }
    return String(rawRole).trim();
};

window.FoodBridge.getUserEmail = function () {
    const user = window.FoodBridge.getUser();
    if (user && user.email) return user.email;
    const claims = window.FoodBridge.getClaims();
    if (!claims) return '';
    return claims['http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress'] || claims['email'] || claims['sub'] || '';
};

window.FoodBridge.isDonor = function () {
    const role = window.FoodBridge.getUserRole();
    return String(role).trim().toLowerCase() === 'donor';
};

window.FoodBridge.isReceiver = function () {
    const role = window.FoodBridge.getUserRole();
    const r = String(role).trim().toLowerCase();
    return r === 'receiver' || r === 'ngo';
};

// Authenticated Fetch wrapper
window.FoodBridge.authFetch = function (url, options = {}) {
    options.headers = options.headers || {};
    const token = window.FoodBridge.getToken();
    if (token) {
        if (options.headers instanceof Headers) {
            options.headers.set('Authorization', 'Bearer ' + token);
        } else {
            options.headers['Authorization'] = 'Bearer ' + token;
        }
    }
    return fetch(url, options);
};

// Local date-time string helper (preserves user's local timezone instead of converting to UTC)
window.FoodBridge.toLocalDateTimeString = function (val) {
    if (val) {
        return val.length === 16 ? val + ':00' : val;
    }
    const d = new Date();
    const pad = (n) => String(n).padStart(2, '0');
    return `${d.getFullYear()}-${pad(d.getMonth() + 1)}-${pad(d.getDate())}T${pad(d.getHours())}:${pad(d.getMinutes())}:${pad(d.getSeconds())}`;
};

// Full Page Navigation with Authorization Header
window.FoodBridge.navigateWithAuth = function (url) {
    const token = window.FoodBridge.getToken();
    if (!token) {
        window.location.href = '/Home/Login';
        return;
    }
    window.location.href = url;
};

// Local Food Listings Storage (to display already donated food)
window.FoodBridge.getDonatedFoods = function () {
    const raw = localStorage.getItem(window.FoodBridge.DONATIONS_KEY);
    if (!raw) {
        return [];
    }
    try {
        return JSON.parse(raw);
    } catch {
        return [];
    }
};

window.FoodBridge.saveDonation = function (food) {
    const list = window.FoodBridge.getDonatedFoods();
    const newEntry = {
        id: Date.now(),
        foodName: food.foodName || food.FoodName,
        quntity: Number(food.quntity || food.Quntity || 1),
        emailID: food.emailID || window.FoodBridge.getUserEmail() || "donor@foodbridge.org",
        items: Array.isArray(food.items) ? food.items : (food.items ? String(food.items).split(',').map(s => s.trim()).filter(Boolean) : []),
        timeAgo: "Just now"
    };
    list.unshift(newEntry);
    localStorage.setItem(window.FoodBridge.DONATIONS_KEY, JSON.stringify(list));
    return newEntry;
};

// Dynamic Navbar State Renderer
window.FoodBridge.updateAuthUI = function () {
    const token = window.FoodBridge.getToken();
    const isDonor = window.FoodBridge.isDonor();
    const isReceiver = window.FoodBridge.isReceiver();
    const user = window.FoodBridge.getUser();
    const navActions = document.querySelector('.nav-actions');
    const navMenu = document.getElementById('navMenu');

    // Toggle donor link & portal button visibility
    document.querySelectorAll('.donor-nav-item').forEach(link => {
        link.style.display = isDonor ? '' : 'none';
    });

    // Toggle receiver link visibility
    document.querySelectorAll('.receiver-nav-item').forEach(link => {
        link.style.display = isReceiver ? '' : 'none';
    });

    if (navActions) {
        if (token) {
            const role = window.FoodBridge.getUserRole() || 'Member';
            const email = window.FoodBridge.getUserEmail();
            const displayName = user?.name || (email ? email.split('@')[0] : 'User');

            navActions.innerHTML = `
                <div class="user-identity-badge">
                    <span class="role-tag">${role}</span>
                    <span>${displayName}</span>
                </div>
                <button id="navSignOutBtn" class="btn-secondary-custom" type="button" style="cursor:pointer;">
                    Sign Out
                </button>
            `;

            const signOutBtn = document.getElementById('navSignOutBtn');
            if (signOutBtn) {
                signOutBtn.addEventListener('click', () => {
                    window.FoodBridge.clearToken();
                    window.location.href = '/Home/Login';
                });
            }
        } else {
            navActions.innerHTML = `
                <a class="btn-secondary-custom" href="/Home/Login">Sign In</a>
                <a class="btn-primary-custom" href="/Home/Index">Create Account</a>
            `;
        }
    }
};

// Modal helpers
window.FoodBridge.openDonorPortalModal = function () {
    const modal = document.getElementById('globalDonorPortalModal');
    if (!modal) return;
    const emailInput = document.getElementById('modalDonorEmail');
    if (emailInput) {
        emailInput.value = window.FoodBridge.getUserEmail() || '';
    }
    const msg = document.getElementById('modalFormMessage');
    if (msg) {
        msg.textContent = '';
        msg.className = 'form-message mb-3';
    }
    modal.classList.add('is-open');
    const titleInput = document.getElementById('modalFoodTitle');
    if (titleInput) titleInput.focus();
};

window.FoodBridge.closeDonorPortalModal = function () {
    const modal = document.getElementById('globalDonorPortalModal');
    if (modal) {
        modal.classList.remove('is-open');
    }
};

// Lifecycle initialization
document.addEventListener('DOMContentLoaded', () => {
    if (window.FoodBridge && window.FoodBridge.updateAuthUI) {
        window.FoodBridge.updateAuthUI();
    }

    // Attach click handler to Donor Home & Donor Portal links for Auth routing
    document.querySelectorAll('a[href="/Home/DonerHome"]').forEach(link => {
        link.addEventListener('click', (e) => {
            const token = window.FoodBridge.getToken();
            if (!token) {
                e.preventDefault();
                window.location.href = '/Home/Login';
                return;
            }
            if (!window.FoodBridge.isDonor()) {
                e.preventDefault();
                alert('Access restricted: Only registered Donors can view the Donor Dashboard.');
                return;
            }
            e.preventDefault();
            window.FoodBridge.navigateWithAuth('/Home/DonerHome');
        });
    });

    document.querySelectorAll('a[href="/Home/DonorPortal"]').forEach(link => {
        link.addEventListener('click', (e) => {
            const token = window.FoodBridge.getToken();
            if (!token) {
                e.preventDefault();
                window.location.href = '/Home/Login';
                return;
            }
            if (!window.FoodBridge.isDonor()) {
                e.preventDefault();
                alert('Access restricted: Only registered Donors can access the Donor Portal.');
                return;
            }
            e.preventDefault();
            window.FoodBridge.navigateWithAuth('/Home/DonorPortal');
        });
    });

    // Attach click handler to Receiver Home links for Auth routing
    document.querySelectorAll('a[href="/Home/ReceiverHome"]').forEach(link => {
        link.addEventListener('click', (e) => {
            const token = window.FoodBridge.getToken();
            if (!token) {
                e.preventDefault();
                window.location.href = '/Home/Login';
                return;
            }
            if (!window.FoodBridge.isReceiver()) {
                e.preventDefault();
                alert('Access restricted: Only registered Receivers can view the Receiver Dashboard.');
                return;
            }
            e.preventDefault();
            window.FoodBridge.navigateWithAuth('/Home/ReceiverHome');
        });
    });

    // Attach click handler to Request Food links for Auth routing
    document.querySelectorAll('a[href="/Home/RequestFood"]').forEach(link => {
        link.addEventListener('click', (e) => {
            const token = window.FoodBridge.getToken();
            if (!token) {
                e.preventDefault();
                window.location.href = '/Home/Login';
                return;
            }
            if (!window.FoodBridge.isReceiver()) {
                e.preventDefault();
                alert('Access restricted: Only registered Receivers can access the Food Request Portal.');
                return;
            }
            e.preventDefault();
            window.FoodBridge.navigateWithAuth('/Home/RequestFood');
        });
    });

    // Navbar Donor Portal button opens modal
    const navPortalBtn = document.getElementById('navDonorPortalBtn');
    if (navPortalBtn) {
        navPortalBtn.addEventListener('click', () => {
            if (!window.FoodBridge.isDonor()) {
                alert('Only registered Donors can access the Donor Portal.');
                return;
            }
            window.FoodBridge.openDonorPortalModal();
        });
    }

    // Modal Close buttons
    const closeBtn = document.getElementById('closeDonorPortalModalBtn');
    if (closeBtn) {
        closeBtn.addEventListener('click', window.FoodBridge.closeDonorPortalModal);
    }
    const modalBackdrop = document.getElementById('globalDonorPortalModal');
    if (modalBackdrop) {
        modalBackdrop.addEventListener('click', (e) => {
            if (e.target === modalBackdrop) {
                window.FoodBridge.closeDonorPortalModal();
            }
        });
    }

    // Global Modal Form Submission (POST /DonerHome)
    const modalForm = document.getElementById('globalDonationForm');
    if (modalForm) {
        modalForm.addEventListener('submit', async (e) => {
            e.preventDefault();
            const submitBtn = document.getElementById('modalSubmitDonationBtn');
            const message = document.getElementById('modalFormMessage');
            message.textContent = '';
            message.className = 'form-message mb-3';

            const foodName = document.getElementById('modalFoodTitle').value.trim();
            const emailID = document.getElementById('modalDonorEmail').value.trim();
            const quntity = parseInt(document.getElementById('modalQuantity').value, 10);
            const rawItems = document.getElementById('modalItemsDetail').value.trim();

            if (!foodName || !emailID || isNaN(quntity) || quntity < 1) {
                message.textContent = 'Please fill out all required fields with valid values.';
                message.classList.add('is-error');
                return;
            }

            const items = rawItems ? rawItems.split(',').map(s => s.trim()).filter(Boolean) : [foodName];

            submitBtn.disabled = true;
            submitBtn.innerHTML = 'Submitting donation... <span class="spinner-dot" aria-hidden="true"></span>';

            try {
                const response = await fetch('/DonerHome', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                        'Authorization': 'Bearer ' + window.FoodBridge.getToken()
                    },
                    body: JSON.stringify({
                        FoodName: foodName,
                        emailID: emailID,
                        quntity: quntity,
                        items: items
                    })
                });

                const resText = await response.text();
                if (!response.ok) {
                    throw new Error(resText || 'Failed to submit food donation.');
                }

                message.textContent = 'Food donation listed successfully!';
                message.classList.add('is-success');

                // Reset form fields
                document.getElementById('modalFoodTitle').value = '';
                document.getElementById('modalQuantity').value = '';
                document.getElementById('modalItemsDetail').value = '';

                // If currently on Donor Dashboard, refresh the live feed
                if (typeof window.fetchDonorFoodFeed === 'function') {
                    window.fetchDonorFoodFeed();
                }

                setTimeout(() => {
                    window.FoodBridge.closeDonorPortalModal();
                }, 900);

            } catch (err) {
                message.textContent = err.message || 'Error occurred while submitting donation.';
                message.classList.add('is-error');
            } finally {
                submitBtn.disabled = false;
                submitBtn.innerHTML = '<span>Submit Food Donation</span> <span aria-hidden="true">&rarr;</span>';
            }
        });
    }
});

