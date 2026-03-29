# 🗳️ Azure Voting App - Production Grade IaC & Kubernetes

Is project mein maine ek **5-Tier Voting Application** ko deploy kiya hai. Isme Infrastructure as Code (IaC) ke liye **Terraform** aur Container Orchestration ke liye **Azure Kubernetes Service (AKS)** ka use kiya gaya hai.

---

## 🚀 Key Features

* **Infrastructure as Code:** Pura setup Terraform se automated hai.
* **Remote Backend:** Terraform state files ko **Azure Blob Storage** mein secure rakha gaya hai (State Locking ke saath).
* **Modular Design:** Networking (VNet), Storage, aur AKS ke liye modular approach.
* **CI/CD Pipeline:** **GitHub Actions** ka use karke automated deployment setup hai.
* **Production Standards:** Zero-downtime deployments aur environment variables ka proper use.

---

## 🛠️ Tech Stack

| Component | Technology |
| :--- | :--- |
| **Cloud Provider** | Microsoft Azure |
| **IaC Tool** | Terraform |
| **Orchestration** | Kubernetes (AKS) |
| **Version Control** | Git & GitHub |
| **CI/CD** | GitHub Actions |
| **Application** | Python (Voting), .NET (Worker), Node.js (Result) |
| **Database/Cache** | Redis & PostgreSQL |

---

## 📂 Project Structure

```text
.
├── terraform/                # Infrastructure code
│   ├── main.tf               # Main configuration
│   ├── variables.tf          # Input variables
│   ├── backend.tf            # Remote state config
│   └── outputs.tf            # Output values
├── k8s-specifications/       # Kubernetes Manifests (YAMLs)
├── .github/workflows/        # CI/CD Pipeline logic
└── README.md                 # Project Documentation
🛠️ How to Run Locally
Clone the Repo:

Bash
git clone [https://github.com/YOUR_USERNAME/YOUR_REPO_NAME.git](https://github.com/YOUR_USERNAME/YOUR_REPO_NAME.git)
cd YOUR_REPO_NAME
Terraform Deployment:

Bash
cd terraform
terraform init
terraform plan
terraform apply -auto-approve
Kubernetes Deploy:

Bash
az aks get-credentials --resource-group YOUR_RG --name YOUR_CLUSTER
kubectl apply -f k8s-specifications/
👨‍💻 Author
Shashank
Senior DevOps Consultant & Automation Engineer


---

### Isse Save aur Push kaise karein?
1. File ko save karo `README.md` naam se.
2. Terminal mein ye commands chalao:
   ```bash
   git add README.md
   git commit -m "Added professional README documentation"
   git push origin main
