using FoodBridge.Models;
using Microsoft.EntityFrameworkCore;

namespace FoodBridge.DATA;

public class FoodBridgeDB:DbContext
{
    public FoodBridgeDB(DbContextOptions<FoodBridgeDB> options) : base(options)
    {
        
    }

    public DbSet<User> Users
    {
        get { return Set<User>(); }
    }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        base.OnModelCreating(modelBuilder);
        modelBuilder.Entity<User>().HasIndex(u => u.EmailID).IsUnique();

    }
}