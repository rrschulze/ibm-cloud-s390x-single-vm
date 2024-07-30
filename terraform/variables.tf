variable id {
  description = "Lab id"
  type        = string
  default     = "ngvpdfagvoiesa"
}

variable ibmcloud_api_key {
  description = "The IBM Cloud API key"
  type        = string
}

variable ssh_key_prefix {
  description = "ssh key name prefix"
  type        = string
  default     = "ssh-key"
}

variable ssh_public_key {
  description = "ssh public key"
  type        = string
}

variable region {
  description = "IBM Cloud region "
  type        = string
  default     = "us-east"
}

variable zone {
  description = "Zone in IBM Cloud region"
  type        = string
  default     = "us-east-1"
}

variable rg_prefix {
  description = "Name prefix of resource group"
  type        = string
  default     = "rg"
}

variable vpc_prefix {
  description = "Name of VPC"
  type        = string
  default     = "vpc"
}


variable subnet_prefix {
  description = "Name of subnet to deploy too"
  type        = string
  default     = "sn"
}

variable subnet_ip_range {
  description = "Subnet IP range"
  type        = string
  default     = "10.241.0.0/24"
}

variable s390x_image {
  description = "s390x image name "
  type        = string
  default     = "ibm-ubuntu-22-04-4-minimal-s390x-3"
}

variable s390x_machine_type {
  description = "s390x VSI machine type. "
  type        =  string
  default     = "bz2-2x8"
}

variable enable_fip {
  description = "Enable floating IP."
  type        = bool
  default     = true
}
