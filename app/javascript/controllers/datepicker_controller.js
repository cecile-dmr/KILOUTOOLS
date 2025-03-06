import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";
// Connects to data-controller="datepicker"
export default class extends Controller {
  static targets = ["startDate", "endDate"]

  connect() {
   // Configuration pour la date de début
   this.startDatePicker = flatpickr(this.startDateTarget, {
    minDate: "today",
    dateFormat: "Y-m-d",
    onChange: (selectedDates, dateStr) => {
      // Mettre à jour la date minimale pour le datepicker de fin
      if (this.endDatePicker) {
        this.endDatePicker.set("minDate", dateStr);
      }
    }
  });

  // Configuration pour la date de fin
  this.endDatePicker = flatpickr(this.endDateTarget, {
    minDate: "today",
    dateFormat: "Y-m-d"
  });
}
}
