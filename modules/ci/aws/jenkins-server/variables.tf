# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# You must provide a value for each of these parameters.
# ---------------------------------------------------------------------------------------------------------------------

variable "name" {
  description = "The name of the Jenkins Auto Scaling Group (e.g. jenkins-production). This variable is used to namespace all resources created by this module."
}

variable "efs_name" {
  description = "This is used to name the EFS resources."
}

variable "environment" {
  description = "The name of the given environment. This property is passed to submodules created by this module."
}

variable "ami_id" {
  description = "The ID of the AMI to run in this Auto Scaling Group."
}

variable "instance_type" {
  description = "The type of EC2 Instances to run for each node in the ASG (e.g. t2.micro)."
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = "list"
}

variable "vpc_id" {
  description = "The ID of the VPC in which to deploy the Jenkins resources."
}

variable "subnet_ids" {
  description = "The subnet IDs into which the EC2 Instances should be deployed."
  type        = "list"
}

variable "efs_subnet_ids" {
  description = "The subnet IDs into which the EFS file system used for Jenkins data should be deployed."
  type        = "list"
}

variable "user_data" {
  description = "A User Data script to execute while the instances are booting."
}

# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
# ---------------------------------------------------------------------------------------------------------------------

variable "min_size" {
  description = "The minimum number of nodes to have in the Auto Scaling Group."
  default     = 1
}

variable "max_size" {
  description = "The maximum number of nodes to have in the Auto Scaling Group."
  default     = 1
}

variable "key_pair_name" {
  description = "The name of an EC2 Key Pair that can be used to SSH to the EC2 Instances in this cluster. Set to an empty string to not associate a Key Pair."
  default     = ""
}

variable "allowed_http_cidr_blocks" {
  description = "A list of CIDR-formatted IP address ranges from which the EC2 Instances will allow HTTP connections."
  type        = "list"
  default     = []
}

variable "allowed_ssh_cidr_blocks" {
  description = "A list of CIDR-formatted IP address ranges from which the EC2 Instances will allow SSH connections."
  type        = "list"
  default     = []
}

variable "allowed_ssh_security_group_ids" {
  description = "A list of Security Group IDs from which the EC2 instances will allow SSH connections."
  type        = "list"
  default     = []
}

variable "termination_policies" {
  description = "A list of policies to decide how the instances in the Auto Scaling Group should be terminated. The allowed values are OldestInstance, NewestInstance, OldestLaunchConfiguration, ClosestToNextInstanceHour, Default."
  default     = "Default"
}

variable "associate_public_ip_address" {
  description = "If set to true, associate a public IP address with each EC2 Instance in the cluster."
  default     = false
}

variable "spot_price" {
  description = "The maximum hourly price to pay for EC2 Spot Instances."
  default     = ""
}

variable "tenancy" {
  description = "The tenancy of the instance. Must be one of: empty string, default, or dedicated. For EC2 Spot Instances only empty string or dedicated can be used."
  default     = ""
}

variable "root_volume_ebs_optimized" {
  description = "If true, the launched EC2 instance will be EBS-optimized."
  default     = false
}

variable "root_volume_type" {
  description = "The type of volume. Must be one of: standard, gp2, or io1."
  default     = "gp2"
}

variable "root_volume_size" {
  description = "The size, in GB, of the root EBS volume."
  default     = 50
}

variable "root_volume_delete_on_termination" {
  description = "Whether the volume should be destroyed on instance termination."
  default     = true
}

variable "root_volume_iops" {
  description = "The amount of provisioned IOPS for the root volume. Only used if volume type is io1."
  default     = 0
}

variable "ebs_block_devices" {
  description = "A list of EBS volumes to attach to each EC2 Instance. Each item in the list should be an object with the keys 'device_name', 'volume_type', 'volume_size', 'iops', 'delete_on_termination', and 'encrypted', as defined here: https://www.terraform.io/docs/providers/aws/r/launch_configuration.html#block-devices. We recommend using at least one EBS Volume for the Jenkins data directory."
  type        = "list"
  default     = []

  # Example:
  #
  # default = [
  #   {
  #     device_name = "/dev/xvdh"
  #     volume_type = "gp2"
  #     volume_size = 300
  #     encrypted   = true
  #   }
  # ]
}

variable "wait_for_capacity_timeout" {
  description = "A maximum duration that Terraform should wait for ASG instances to be healthy before timing out. Setting this to '0' causes Terraform to skip all Capacity Waiting behavior."
  default     = "10m"
}

variable "health_check_type" {
  description = "Controls how health checking is done. Must be one of EC2 or ELB."
  default     = "EC2"
}

variable "health_check_grace_period" {
  description = "Time, in seconds, after instance comes into service before checking health."
  default     = 600
}

variable "instance_profile_path" {
  description = "Path in which to create the IAM instance profile."
  default     = "/"
}

variable "volume_mountpoint" {
  description = "Path in which to create the IAM instance profile."
  default     = "/mnt/jenkins"
}

variable "volume_owner" {
  description = "Path in which to create the IAM instance profile."
  default     = "jenkins"
}

variable "ssh_port" {
  description = "The port used for SSH connections"
  default     = 22
}

variable "http_port" {
  description = "The port used for HTTP connections"
  default     = 8080
}

variable "target_group_arns" {
  description = "A list of ALB target groups to associate the Auto Scaling Group with."
  type        = "list"
  default     = []
}

variable "tags" {
  description = "List of extra tag blocks added to the Auto Scaling Group configuration. Each element in the list is a map containing keys 'key', 'value', and 'propagate_at_launch' mapped to the respective values."
  type        = "list"
  default     = []

  # Example:
  #
  # default = [
  #   {
  #     key                 = "foo"
  #     value               = "bar"
  #     propagate_at_launch = true
  #   }
  # ]
}
