pipeline {
  agent any
  environment {
    NEW_VERSION ='1.3.0'
    SERVER_CREDENTIALS = credentials('credentialId')
  }
  strages {
    stage("Instal dependencies") {
        echo 'Installing dependencies ...'
        sh 'yarn install'
        echo 'Finished dependencies installation.'
    }
    stage("Build") {
      steps {
        echo 'Building application ...'
        echo "App version: ${NEW_VERSION}"
        sh 'yarn build --output-path=dist'
        echo 'Finished building application.'
      }
    }
    stage("Test") {
      steps {
       echo 'Running tests ...'
       sh 'yarn test'
       echo 'Finished running tests'
      }
    }
    stage("E2E Test") {
      steps {
       echo 'Running e2e tests ...'
       sh 'yarn e2e'
       echo 'Finished running e2e tests'
      }
    }
}
