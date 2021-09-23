using Microsoft.EntityFrameworkCore.Migrations;

namespace NIBM_Job_Portal.Migrations
{
    public partial class Addedtemppassword : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "TemporyPassword",
                table: "AspNetUsers",
                type: "longtext",
                nullable: true)
                .Annotation("MySql:CharSet", "utf8mb4");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "TemporyPassword",
                table: "AspNetUsers");
        }
    }
}
