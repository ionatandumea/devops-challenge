# 🌟 DevOps Challenge Guide 🌟

## 🚀 Build and Run the Application Locally Using Docker

### Prerequisites

- 🐳 Docker Engine

### Steps

1. **Navigate to your app directory:**

```bash
cd /path/to/app
```

2. **Build your Docker image:**

```bash
docker build -t devops-challenge .
```

3. **Run your Docker container:**

```bash
docker run -p 3000:3000 devops-challenge
```

🎉 Great! Now you can access the web server at: [http://localhost:3000](http://localhost:3000)

## 🛠️ Set Up the Infrastructure Using Terraform

### Prerequisites

- 🌍 Terraform CLI (>=1.2.0+)
- ☁️ AWS CLI
- 🔑 AWS IAM Access Token

### Steps

1. **Create an access token in the IAM section of AWS.**
2. **Configure your AWS CLI:**

```bash
aws configure
```

3. **Initialize the working directory with Terraform:**

```bash
terraform init
```

This downloads and installs the providers specified in the configuration (AWS).

4. **Apply the Terraform configuration:**

```bash
terraform apply --auto-approve
```

✨ Good! Your AWS infrastructure has been updated!

## 📦 Deploy the Application Using the CI/CD Pipeline

The CI/CD pipeline is designed to streamline your deployment process. Here's how it works:

1. **Make a change** in your local repository.
2. **Push the change** to the remote repository.

This triggers GitHub Actions to perform the following:

1. **Build & Push** your application as a Docker Image to Docker Hub.
2. **Deploy** the updated application by:
   - Using SSH to log into the remote EC2 instance.
   - Pulling the latest image from Docker Hub.
   - Reopening the app container with the latest image.

🎉 That's it! Your application is now updated and deployed.

---

Task completed by **Ionatan Dumea** with the greatest pleasure for the awesome **QED team**. 🚀🎉

Happy Coding! 💻✨
