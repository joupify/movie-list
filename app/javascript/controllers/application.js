import { Application } from "@hotwired/stimulus"

import Modal from './controllers/modal_controller.js'
Stimulus.register('modal', ModalController)

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
