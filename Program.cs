using System.Text;
using FoodBridge.DATA;
using FoodBridge.services;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;

namespace FoodBridge;

public class Program
{
    public static void Main(string[] args)
    {
        var builder = WebApplication.CreateBuilder(args);
        builder.Services.AddControllersWithViews();
        builder.Services.AddSingleton<JWTCreate>();
        builder.Services
            .AddAuthentication(JwtBearerDefaults.AuthenticationScheme)
            .AddJwtBearer(options =>
            {
                options.TokenValidationParameters = new TokenValidationParameters
                {
                    ValidateIssuer = true,
                    ValidateAudience = true,
                    ValidateLifetime = true,
                    ValidateIssuerSigningKey = true,

                    ValidIssuer = builder.Configuration["Jwt:Issuer"],

                    ValidAudience = builder.Configuration["Jwt:Audience"],

                    IssuerSigningKey = new SymmetricSecurityKey(
                        Encoding.UTF8.GetBytes(
                            builder.Configuration["Jwt:Key"]!
                        )
                    ),

                    ClockSkew = TimeSpan.Zero
                };
            });
        string connectionString =
            "Server=mysql;Port=3306;Database=foodbridgedb;User=root;Password=Tanmay@1907;";

        builder.Services.AddDbContext<FoodBridgeDB>(options =>
            options.UseMySql(
                connectionString,
                new MySqlServerVersion(new Version(8, 4, 0))
            )
        );
        var app = builder.Build();

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

        if (!app.Environment.IsDevelopment())
        {
            app.UseExceptionHandler("/Home/Error");
            app.UseHsts();
        }
        app.UseHttpsRedirection();
        app.UseStaticFiles();
        app.UseRouting();
        app.UseAuthentication();
        app.UseAuthorization();
        app.MapControllerRoute(
            name: "default",
            pattern: "{controller=Home}/{action=Index}/{id?}"
        );

        app.Run();
    }
}