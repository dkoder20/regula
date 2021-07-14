# Copyright 2020-2021 Fugue, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
package rules.tf_aws_security_groups_ingress_2382

import data.aws.security_groups.library


__rego__metadoc__ := {
  "custom": {
    "controls": {},
    "severity": "High"
  },
  "description": "VPC security group rules should not permit ingress from '0.0.0.0/0' to TCP/UDP port 2382 (SQL Server Analysis Services browser). Removing unfettered connectivity to a SQL Server Analysis Services Browser server reduces the chance of exposing critical data.",
  "id": "FG_R00256",
  "title": "VPC security group rules should not permit ingress from '0.0.0.0/0' to TCP/UDP port 2382 (SQL Server Analysis Services browser)"
}

resource_type = "aws_security_group"

default deny = false

deny {
  library.security_group_ingress_zero_cidr_to_port(input, 2382)
}

