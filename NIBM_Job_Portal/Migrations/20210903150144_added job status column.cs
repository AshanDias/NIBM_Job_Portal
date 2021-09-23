using Microsoft.EntityFrameworkCore.Migrations;

namespace NIBM_Job_Portal.Migrations
{
    public partial class addedjobstatuscolumn : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "Status",
                table: "Job",
                type: "int",
                nullable: false,
                defaultValue: 0);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Status",
                table: "Job");
        }
    }
}
