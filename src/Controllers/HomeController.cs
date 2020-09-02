using System;
using System.Collections;
using System.Collections.Generic;
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
			var envs = new List<string>();
			foreach (DictionaryEntry item in Environment.GetEnvironmentVariables()) {
				var val = item.Value?.ToString() ?? "";
				var v = val.Length > 60 ? val.Substring(0, 60) + "..." : val;
				envs.Add($"{item.Key} = {v}");
			}
			var model = new ConnectionInfo {
				HostName = Environment.MachineName,
				RequestIp = Request.HttpContext.Connection.RemoteIpAddress.MapToIPv4().ToString(),
				Id = Request.HttpContext.Connection.Id,
				EnvVars = envs.ToArray()
			};
			return View(model);
		}
	}
}
