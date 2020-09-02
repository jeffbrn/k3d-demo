using System;

namespace BaseWebApp.Models {
	public class ConnectionInfo {
		public string RequestIp { get; set; }
		public string HostName { get; set; }
		public string Id { get; set; }
		public string[] EnvVars { get; set; }
	}
}
