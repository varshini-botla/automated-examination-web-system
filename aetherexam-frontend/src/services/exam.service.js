import axios from 'axios'

const API_URL = '/api/exams/'

const getQuestionsBySubject = (subject) => {
  return axios.get(`/api/questions/subject/${subject}`, {
    headers: {
      Authorization: 'Bearer ' + JSON.parse(localStorage.getItem('user'))?.token
    }
  })
}

const submitExam = (subject, answers) => {
  return axios.post(API_URL + 'submit', {
    subject,
    answers
  }, {
    headers: {
      Authorization: 'Bearer ' + JSON.parse(localStorage.getItem('user'))?.token
    }
  })
}

const getMyResults = () => {
  return axios.get(API_URL + 'results', {
    headers: {
      Authorization: 'Bearer ' + JSON.parse(localStorage.getItem('user'))?.token
    }
  })
}

const ExamService = {
  getQuestionsBySubject,
  submitExam,
  getMyResults
}

export default ExamService
