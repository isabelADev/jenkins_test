pipeline {
  agent any
  environment {
    NEW_VERSION ='1.3.0'
    SERVER_CREDENTIALS = credentials('credentialId')
  }
  strages {
    stage("Instal dependencies") {
        echo 'Installing dependencies ...'
        sh 'npm install'
        echo 'Finished dependencies installation.'
    }
    stage("Build") {
      steps {
        echo 'Building application ...'
        echo "App version: ${NEW_VERSION}"
        sh 'npm run build'
        echo 'Finished building application.'
      }
    }
    stage("Test") {
      steps {
      
      }
    }
    stage("Deploy") {
      when {
        expression {
          BRANCH_NAME == 'dev'
        }
      }
      steps {
        echo 'Deploying application ...'
        withCredentials([
          usesnamePassword(credentials: 'credentialId', usernameVariable: USER, passwordVariable: PWD)
        ]) {
          sh 'Do copy artifact to someplace and use ${USER} and ${PWD}' 
        }
      }
    }
  }
  post {
    always {
    
    }
    success {
    
    }
    failure {
    
    }
  }
}
