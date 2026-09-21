using System.Diagnostics;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using FoodBridge.Models;

namespace FoodBridge.Controllers;

public class HomeController : Controller
{
    
    public IActionResult Index()
    {
        return View();
    }

    public IActionResult Privacy()
    {
        return View();
    }

    public IActionResult Login()
    {
        return View();
    }

    public IActionResult DonerHome()
    {
        return View();
    }

    public IActionResult DonorPortal()
    {
        return View();
    }

    public IActionResult ReceiverHome()
    {
        return View();
    }

    public IActionResult RequestFood()
    {
        return View();
    }


    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}
