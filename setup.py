import boto3

# ---------SETTINGS----------------
image_id = 'ami-08c40ec9ead489470'  # ubuntu 22.04
key_name = 'vockey'
instance_type = 'm4.large'

# ----------SCRIPT-----------------
ec2_client = boto3.client("ec2")
ec2_resource = boto3.resource("ec2")
elbv2_client = boto3.client('elbv2')

with open('shell/initInstance.sh', 'r') as file:
    instance_init_script = file.read()

instance = ec2_client.run_instances(
    ImageId=image_id,
    MinCount=1,
    MaxCount=1,
    InstanceType=instance_type,
    KeyName=key_name,
    UserData=instance_init_script
)