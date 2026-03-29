# vote-app/main.tf

# SYaha sabhi module ko call karke bacend se resources provision honge aur sabse bada benifit standalone 
# mode me modules ki calling kar sakte hai




#REDIS

module "redis" {
  source      = "./modules/redis"
  redis_image = var.images["redis"]
}

#DB

module "db" {
  source   = "./modules/db"
  db_image = var.images["db"]
}


#WORKER

module "worker" {
  source       = "./modules/worker"
  worker_image = var.images["worker"]
}


#VOTE
module "vote" {
  source        = "./modules/vote"
  vote_image    = var.images["vote"]
  vote_replicas = 2
}


#RESULT

module "result" {
  source       = "./modules/result"
  result_image = var.images["result"]
}



