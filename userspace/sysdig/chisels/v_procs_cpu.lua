--[[
Copyright (C) 2013-2015 Draios inc.
 
This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License version 2 as
published by the Free Software Foundation.


This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
--]]

view_info = 
{
	id = "procs_cpu",
	name = "Processes CPU",
	description = "Show total versus user versus system CPU usage for every process.",
	tips = {"If a process shows an unusual amount of system CPU usage, you can drill down with the 'System Calls' view to understand what it's doing."},
	view_type = "table",
	applies_to = {"", "container.id", "fd.name", "fd.sport", "evt.type", "fd.directory", "fd.type"},
	is_root = true,
	drilldown_target = "threads",
	use_defaults = true,
	columns = 
	{
		{
			name = "NA",
			field = "thread.tid",
			is_key = true
		},
		{
			name = "NA",
			field = "proc.pid",
			is_groupby_key = true
		},
		{
			name = "PID",
			description = "Process PID.",
			field = "proc.pid",
			colsize = 8,
		},
		{
			tags = {"containers"},
			name = "VPID",
			field = "proc.vpid",
			description = "PID that the process has inside the container.",
			colsize = 8,
		},
		{
			name = "TOT",
			field = "thread.cpu",
			description = "Total amount of CPU used by the proccess (user + system).",
			aggregation = "AVG",
			groupby_aggregation = "SUM",
			colsize = 8,
			is_sorting = true
		},
		{
			name = "USER",
			field = "thread.cpu.user",
			description = "Amount of user CPU used by the proccess.",
			aggregation = "AVG",
			groupby_aggregation = "SUM",
			colsize = 8,
		},
		{
			name = "SYS",
			field = "thread.cpu.system",
			description = "Amount of system CPU used by the proccess.",
			aggregation = "AVG",
			groupby_aggregation = "SUM",
			colsize = 8,
		},
		{
			tags = {"containers"},
			name = "The container this process belongs to.",
			field = "container.name",
			colsize = 15
		},
		{
			name = "Command",
			description = "The full command line of the process.",
			field = "proc.exeline",
			colsize = 200
		}
	}
}