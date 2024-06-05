# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# --------------------------------------------------------------------------------------------------------------------- 

variable "secret_id" {
  description = "The ID of the secret."
}

variable "secret_label" {
  description = "The label of the secret."

}
variable "project" {
  description = "The project ID where all resources will be launched."
  type        = string
}

variable "region" {
  description = "The region where all resources will be launched."
  type        = string
}

variable "zone" {
  description = "The zone where all resources will be launched."
  type        = string
}