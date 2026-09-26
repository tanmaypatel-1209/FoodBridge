# FoodBridge MySQL & Docker Configuration Backup

### 1. Connection String:
```csharp
Server=mysql;Port=3306;Database=foodbridgedb;User=root;Password=Tanmay@1907;
```

### 2. Localhost Connection String (if running outside Docker):
```csharp
Server=localhost;Port=3306;Database=foodbridgedb;User=root;Password=Tanmay@1907;
```

### 3. Program.cs DbContext Configuration:
```csharp
builder.Services.AddDbContext<FoodBridgeDB>(options =>
    options.UseMySql(
        connectionString,
        new MySqlServerVersion(new Version(8, 4, 0))
    )
);
```

### 4. Database Retry Loop in Program.cs:
```csharp
using (var scope = app.Services.CreateScope())
{
    var db = scope.ServiceProvider.GetRequiredService<FoodBridgeDB>();
    for (int i = 0; i < 15; i++)
    {
        try
        {
            db.Database.EnsureCreated();
            break;
        }
        catch
        {
            Thread.Sleep(2000);
        }
    }
}
```

### 5. Docker Compose Configuration (compose.yaml):
```yaml
services:
  mysql:
    image: mysql:8.4
    container_name: foodbridge-mysql
    environment:
      MYSQL_ROOT_PASSWORD: "Tanmay@1907"
      MYSQL_DATABASE: foodbridgedb
      TZ: "Asia/Kolkata"
    ports:
      - "3306:3306"
    volumes:
      - mysql_data:/var/lib/mysql

  api:
    build: .
    container_name: foodbridge-api
    environment:
      TZ: "Asia/Kolkata"
    ports:
      - "5000:8080"
    depends_on:
      - mysql

volumes:
  mysql_data:
```

### 6. Local Modifications to Re-apply:
- `Controllers/DonerHome.cs`: `wf.foodWast(email, "Donor");`
- `services/wastfood.cs`: `role == "Donor"` and `role == "NGOs"`, time calculation `(now - donationDateTime.Value).TotalHours >= 1`
- `services/MatchFoodRequirement.cs`: case-insensitive city/state comparison and unassigned `minWast` fix.
