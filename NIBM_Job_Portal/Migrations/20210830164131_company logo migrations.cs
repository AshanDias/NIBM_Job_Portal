using Microsoft.EntityFrameworkCore.Migrations;

namespace NIBM_Job_Portal.Migrations
{
    public partial class companylogomigrations : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "ApplicationUserId",
                table: "Company",
                type: "varchar(255)",
                nullable: true)
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.AddColumn<int>(
                name: "ApplicationUser_Id",
                table: "Company",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<string>(
                name: "Image",
                table: "Company",
                type: "longtext",
                nullable: true)
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateIndex(
                name: "IX_Company_ApplicationUserId",
                table: "Company",
                column: "ApplicationUserId");

            migrationBuilder.AddForeignKey(
                name: "FK_Company_AspNetUsers_ApplicationUserId",
                table: "Company",
                column: "ApplicationUserId",
                principalTable: "AspNetUsers",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Company_AspNetUsers_ApplicationUserId",
                table: "Company");

            migrationBuilder.DropIndex(
                name: "IX_Company_ApplicationUserId",
                table: "Company");

            migrationBuilder.DropColumn(
                name: "ApplicationUserId",
                table: "Company");

            migrationBuilder.DropColumn(
                name: "ApplicationUser_Id",
                table: "Company");

            migrationBuilder.DropColumn(
                name: "Image",
                table: "Company");
        }
    }
}
