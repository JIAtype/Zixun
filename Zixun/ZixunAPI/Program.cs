using ZixunAPI.Data;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers().AddJsonOptions(options=>options.JsonSerializerOptions.Converters.Add(new DateTimeConverter()));
builder.Services.AddDbContext<AppDbContext>();

// �����������
builder.Services.AddCors();

var app = builder.Build();

// Configure the HTTP request pipeline.

app.UseAuthorization();

app.UseStaticFiles();


// �����������
app.UseCors(x => x
                .AllowAnyMethod()
                .AllowAnyHeader()
                .SetIsOriginAllowed(origin => true) // allow any origin
                .AllowCredentials()); // allow credentials

app.MapControllers();

app.Run();
