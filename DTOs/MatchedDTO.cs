namespace FoodBridge.DTOs;

public class MatchedDTO
{
    public FoodDTO? food { get; set; }
    public NeededFoodDTO? neededFood { get; set; }

    public MatchedDTO()
    {
    }

    public MatchedDTO(FoodDTO? food, NeededFoodDTO? neededFood)
    {
        this.food = food;
        this.neededFood = neededFood;
    }

    public MatchedDTO(NeededFoodDTO? neededFood, FoodDTO? food)
    {
        this.food = food;
        this.neededFood = neededFood;
    }
}