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

# This package was automatically generated from:
#
#     tests/rules/cfn/s3/inputs/valid_https_access_bucket_policy_infra.cfn
#
# using `generate_test_inputs.sh` and should not be modified
# directly.
#
# It provides three inputs for testing:
# - mock_input: The resource view input as passed to advanced rules
# - mock_resources: The resources present as a convenience for tests
# - mock_plan_input: The original plan input as generated by terraform
package tests.rules.cfn.s3.inputs.valid_https_access_bucket_policy_infra
import data.fugue.resource_view.resource_view_input
mock_input = ret {
  ret = resource_view_input with input as mock_plan_input
}
mock_resources = mock_input.resources
mock_plan_input = {
  "AWSTemplateFormatVersion": "2010-09-09",
  "Description": "Valid S3 HTTPS access configuration",
  "Resources": {
    "Bucket1": {
      "Type": "AWS::S3::Bucket"
    },
    "Bucket1Policy": {
      "Type": "AWS::S3::BucketPolicy",
      "Properties": {
        "Bucket": {
          "Ref": "Bucket1"
        },
        "PolicyDocument": {
          "Statement": [
            {
              "Effect": "Allow",
              "Principal": "*",
              "Action": "s3:Get*",
              "Resource": [
                {
                  "Fn::GetAtt": [
                    "Bucket1",
                    "Arn"
                  ]
                }
              ]
            },
            {
              "Effect": "Deny",
              "Principal": "*",
              "Action": "*",
              "Resource": [
                {
                  "Fn::GetAtt": [
                    "Bucket1",
                    "Arn"
                  ]
                }
              ],
              "Condition": {
                "Bool": {
                  "aws:SecureTransport": false
                }
              }
            }
          ]
        }
      }
    },
    "Bucket2": {
      "Type": "AWS::S3::Bucket"
    },
    "Bucket2Policy": {
      "Type": "AWS::S3::BucketPolicy",
      "Properties": {
        "Bucket": {
          "Ref": "Bucket2"
        },
        "PolicyDocument": {
          "Statement": [
            {
              "Effect": "Deny",
              "Principal": "*",
              "Action": "*",
              "Resource": [
                {
                  "Fn::Sub": "${Bucket2.Arn}/*"
                }
              ],
              "Condition": {
                "Bool": {
                  "aws:SecureTransport": false
                }
              }
            }
          ]
        }
      }
    }
  }
}
