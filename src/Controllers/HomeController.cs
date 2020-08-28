using System;
using BaseWebApp.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;

namespace BaseWebApp.Controllers {
	[Route("")]
	public class HomeController : Controller {
		private readonly ILogger _log;

		public HomeController(ILogger<HomeController> log) {
			_log = log;
		}

		[HttpGet("")]
		public IActionResult Index() {
			_log.LogInformation("Handling 'Home.Index' request");
			var model = new ConnectionInfo {
				HostName = Environment.MachineName,
				RequestIp = Request.HttpContext.Connection.RemoteIpAddress.MapToIPv4().ToString(),
				Id = Request.HttpContext.Connection.Id
			};
			return View(model);
		}
	}
}
