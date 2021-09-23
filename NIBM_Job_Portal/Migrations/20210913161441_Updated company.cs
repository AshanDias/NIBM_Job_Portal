using Microsoft.EntityFrameworkCore.Migrations;

namespace NIBM_Job_Portal.Migrations
{
    public partial class Updatedcompany : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Company_JobCategory_JobCategoryId",
                table: "Company");

            migrationBuilder.DropIndex(
                name: "IX_Company_JobCategoryId",
                table: "Company");

            migrationBuilder.DropColumn(
                name: "JobCategoryId",
                table: "Company");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "JobCategoryId",
                table: "Company",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.CreateIndex(
                name: "IX_Company_JobCategoryId",
                table: "Company",
                column: "JobCategoryId");

            migrationBuilder.AddForeignKey(
                name: "FK_Company_JobCategory_JobCategoryId",
                table: "Company",
                column: "JobCategoryId",
                principalTable: "JobCategory",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
