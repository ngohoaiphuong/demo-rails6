import { Controller } from "stimulus"

export default class extends Controller {
  connect() {
    console.log('welcome notification')
  }
  disconnect() {}
  initialize() {}
}