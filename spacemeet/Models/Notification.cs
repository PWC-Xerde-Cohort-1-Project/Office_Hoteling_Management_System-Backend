namespace spacemeet.Models
{
    public class Notification
    {
        public int Id { get; set; }
        public string? Title { get; set; }
        public string? Type { get; set; }
        public string? Description { get; set; }
        public DateTime Created { get; set; }
    }
}
