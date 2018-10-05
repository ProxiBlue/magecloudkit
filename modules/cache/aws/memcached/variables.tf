# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# You must provide a value for each of these parameters.
# ---------------------------------------------------------------------------------------------------------------------

variable "vpc_id" {
  description = "The ID of the VPC in which to launch the ElastiCache resources"
}

variable "subnet_ids" {
  type        = "list"
  description = "The IDs of the Subnets in which to launch the ElastiCache resources"
}

# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
# ---------------------------------------------------------------------------------------------------------------------

variable "cluster_name" {
  description = "The name used for the ElastiCache cluster"
  default     = "memcached01"
}

variable "engine" {
  description = "The ElastiCache engine"
  default     = "memcached"
}

variable "engine_version" {
  description = "The ElastiCache engine version"
  default     = "1.4.24"
}

variable "node_type" {
  description = "ElastiCache instance type"
  default     = "cache.m3.large"
}

variable "port" {
  description = "ElastiCache memcached instance port"
  default     = 11211
}

variable "num_cache_nodes" {
  description = "ElastiCache number of cache nodes"
  default     = 1
}

variable "parameter_group_name" {
  description = "ElastiCache number of cache nodes"
  default     = "default.memcached1.4"
}

variable "allowed_memcached_cidr_blocks" {
  description = "A list of CIDR-formatted IP address ranges from which the ElastiCache resources will allow connections."
  type        = "list"
  default     = []
}