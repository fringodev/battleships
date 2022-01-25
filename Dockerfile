FROM public.ecr.aws/lambda/nodejs:14
# Alternatively, you can pull the base image from Docker Hub: amazon/aws-lambda-nodejs:12
ENV NODE_ENV=production
ENV PORT=80

# Assumes your function is named "app.js", and there is a package.json file in the app directory 
COPY .  ${LAMBDA_TASK_ROOT}

# Install NPM dependencies for function
RUN npm install --production

# Set the CMD to your handler (could also be done as a parameter override outside of the Dockerfile)
CMD [ "app.handler" ]