#!/bin/bash
set -euo pipefail

check_awscli() {
    if ! command -v aws &> /dev/null; then
        echo "AWS CLI is not installed. Please install it first." >&2
        exit 1
    fi
}

install_awscli() {
    echo "Installing AWS CLI v2 on Linux..."

    # Download and install AWS CLI v2
    curl -s "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
    sudo apt-get install -y unzip &> /dev/null
    unzip -q awscliv2.zip
    sudo ./aws/install

    # Verify installation
    aws --version

    # Clean up
    rm -rf awscliv2.zip ./aws
}

wait_for_instance() {
    local instance_id="$1"
    echo "Waiting for instance $instance_id to be in running state..."

    while true; do
        state=$(aws ec2 describe-instances --instance-ids "$instance_id" --query 'Reservations[0].Instances[0].State.Name' --output text)
        if [[ "$state" == "running" ]]; then
            echo "Instance $instance_id is now running."
            break
        fi
        sleep 10
    done
}

create_ec2_instance() {
    local ami_id="$1"
    local instance_type="$2"
    local key_name="$3"
    local subnet_id="$4"
    local security_group_ids="$5"
    local instance_name="$6"

    # Run AWS CLI command to create EC2 instance
    instance_id=$(aws ec2 run-instances \
        --image-id "$ami_id" \
        --instance-type "$instance_type" \
        --key-name "$key_name" \
        --subnet-id "$subnet_id" \
        --security-group-ids "$security_group_ids" \
        --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$instance_name}]" \
        --query 'Instances[0].InstanceId' \
        --output text
    )

    if [[ -z "$instance_id" ]]; then
        echo "Failed to create EC2 instance." >&2
        exit 1
    fi

    echo "Instance $instance_id created successfully."

    # Wait for the instance to be in running state
    wait_for_instance "$instance_id"
}

main() {
    check_awscli || install_awscli

    echo "Creating EC2 instance..."

    # Specify the parameters for creating the EC2 instance
    AMI_ID=""
    INSTANCE_TYPE="t2.micro"
    KEY_NAME=""
    SUBNET_ID=""
    SECURITY_GROUP_IDS=""  # Add your security group IDs separated by space
    INSTANCE_NAME="Shell-Script-EC2-Demo"

    # Call the function to create the EC2 instance
    create_ec2_instance "$AMI_ID" "$INSTANCE_TYPE" "$KEY_NAME" "$SUBNET_ID" "$SECURITY_GROUP_IDS" "$INSTANCE_NAME"

    echo "EC2 instance creation completed."
}

main "$@"


# PROJECT 2



# Ye ek advanced Bash shell scripting automation project hai jo AWS CLI ki help se automatically Amazon EC2 instance
# create karne ke liye banaya gaya hai. Script `#!/bin/bash` se start hoti hai jo batata hai ke ye Bash shell me 
# execute hogi, aur `set -euo pipefail` script ko secure aur reliable banata hai kyunke agar koi command fail ho,
# undefined variable use ho, ya pipeline me error aaye to script immediately stop ho jati hai. Sabse pehle `check_awscli()` 
# function check karta hai ke system me AWS CLI installed hai ya nahi using `command -v aws`; agar installed na ho 
# to error message show hota hai aur script exit kar jati hai. `install_awscli()` function AWS CLI v2 ko automatically 
# download aur install karta hai using `curl`, `unzip`, aur `sudo ./aws/install`, phir installation verify karne ke
# liye `aws --version` chalata hai aur temporary files delete kar deta hai. `wait_for_instance()`
# function continuously AWS se EC2 instance ki state check karta rehta hai using `aws ec2 describe-instances` command
#  aur `sleep 10` ki help se har 10 seconds baad verify karta hai ke instance `running` state me aaya ya nahi.
# `create_ec2_instance()` function main deployment logic hai jahan AMI ID, instance type, key pair, subnet ID,
#  security group aur instance name jaise parameters use karke `aws ec2 run-instances` command ke through 
# EC2 instance create kiya jata hai; agar instance successfully create ho jaye to uska Instance ID save hota hai aur
#  phir `wait_for_instance()` function call hota hai taake instance fully running state me aa jaye.
# `main()` function poori script ko control karta hai jahan pehle AWS CLI check/install hoti hai, phir EC2 creation
#  ke liye variables set kiye jate hain jaise `t2.micro` instance type aur custom instance name `"Shell-Script-EC2-Demo"`,
# aur akhir me `create_ec2_instance()` function call hota hai. Overall ye script Bash scripting, Linux automation,
# AWS CLI, cloud infrastructure provisioning, error handling aur DevOps automation concepts ko practical aur professional 
# way me demonstrate karti hai.