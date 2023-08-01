pipeline {
  agent any
  parameters{
    string(name:'containername' , description: 'Please enter container name:')
    string(name:'port' , description: 'Enter port of container: ' )
  stages {
    stage ('Build') {
      steps {
        sh 'mvn clean package'
      }
      post {
        success {
          echo "Now Archiving the Artifacts...."
          archiveArtifacts artifacts: '**/*.war'
        }
      }
    }  
    stage ('Create Image') {
      steps {
         sh 'docker build . -t tomcatsample:${env.BUILD_ID}'
      }
    }
    stage ('Create Container') {
      steps {
        sh 'docker run -it --name $containername -d -p $port:8080 tomcatsample:${env.BUILD_ID}
      }
    }  
  }
}
    
