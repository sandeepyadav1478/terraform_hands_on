import json
import random

def lambda_handler(event, context):
    status_code = random.choice([100,200,300])  # Generate a random HTTP status code (between 100 and 499)
    response_body = {
        "message": "Random response from Lambda function",
        "statusCode": status_code
    }

    response = {
        "statusCode": status_code,
        "body": json.dumps(response_body)
    }

    return response