

var builder = WebApplication.CreateBuilder(new WebApplicationOptions() { WebRootPath = "../../Frontend" });


// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();

    //app.UseDeveloperExceptionPage();
}

//app.UseDefaultFiles();
//app.UseStaticFiles();

app.UseAuthorization();

app.MapControllers();

app.Run();
