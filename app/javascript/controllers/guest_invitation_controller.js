import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [
                    "attending", 
                    "notAttending",
                    "isAttending",
                    "going",
                    "notGoing"
                  ]
  connect() {
    console.log("connected")
  }

  handleAction(event) {
    console.log('test')
    const decision = event.currentTarget.dataset.decision;
    this.clearActiveStatus();
    this.resetFormStatus();
    if (decision === "going") {
      this.attendingTarget.classList.remove("hidden")
      this.isAttendingTarget.value = "attending";
      this.goingTarget.classList.add("active")
      this.notGoingTarget.classList.remove("active")
    } else if (decision === "notGoing") {
      this.notAttendingTarget.classList.remove("hidden")
      this.isAttendingTarget.value = "not_attending";
      this.goingTarget.classList.remove("active")
      this.notGoingTarget.classList.add("active")
    }
  }

  clearActiveStatus() {
    this.goingTarget.classList.remove("active")
    this.notGoingTarget.classList.remove("active")
  }

  resetFormStatus() {
    if (!this.attendingTarget.classList.contains("hidden")) {
      this.attendingTarget.classList.add("hidden");
    }
    if (!this.notAttendingTarget.classList.contains("hidden")) {
      this.notAttendingTarget.classList.add("hidden");
    }
  }
}
