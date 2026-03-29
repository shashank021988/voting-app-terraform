variable "images" {
  type = map(string)
  default = {
    vote   = "dockersamples/examplevotingapp_vote:before"
    result = "dockersamples/examplevotingapp_result:before"
    worker = "dockersamples/examplevotingapp_worker"
    redis  = "redis:alpine"
    db     = "postgres:15-alpine"
  }
}

variable "vote_replicas" {
  type    = number
  default = 2
}



# 3. Azure Region (Agar aapne resources deploy kiye hain toh)
variable "location" {
  description = "Azure region for backend"
  type        = string
  default     = "southindia"
}