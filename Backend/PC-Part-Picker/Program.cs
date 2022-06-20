
var origins = "cors_allow";
var builder = WebApplication.CreateBuilder(new WebApplicationOptions() { WebRootPath = "../../Frontend" });
builder.Services.AddCors(options =>
{
    options.AddPolicy(name : origins,
        builder => builder.AllowAnyOrigin()
        .AllowAnyMethod()
        .AllowAnyHeader()
        );
});

/*
builder.Services.AddCors(options =>
{
    options.AddPolicy(name: origins,
        policy =>
        {
            policy.WithOrigins("*");
        });
});
*/

// Add services to the container.
builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
//builder.Services.AddSwaggerGen();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    //app.UseSwagger();
    //app.UseSwaggerUI();

    app.UseDeveloperExceptionPage();
}

app.UseDefaultFiles();
app.UseStaticFiles();

app.UseCors(origins);
app.UseAuthorization();

app.MapControllers();

app.Run();
