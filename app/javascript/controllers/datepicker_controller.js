import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="datepicker"
export default class extends Controller {
  static targets = ["startDate", "endDate"]

  connect() {
    // Configuration pour la date de début avec mode range
    this.startDatePicker = flatpickr(this.startDateTarget, {
      mode: "range",
      minDate: "today",
      dateFormat: "Y-m-d",
      onChange: (selectedDates) => {
        // Ne fait rien si aucune date n'est sélectionnée
        if (selectedDates.length === 0) return;

        // Si une seule date est sélectionnée, c'est juste la date de début
        if (selectedDates.length === 1) {
          // On peut éventuellement effacer le champ de fin ici
          if (this.hasEndDateTarget) {
            this.endDateTarget.value = "";
          }
        }

        // Si deux dates sont sélectionnées, c'est une plage complète
        if (selectedDates.length === 2) {
          const startDate = selectedDates[0];
          const endDate = selectedDates[1];
          console.log(startDate);
          console.log(endDate);
          this.endDateTarget.innerHTML = endDate

          // Formater la date de fin au format Y-m-d
          const formattedEndDate = this.formatDate(endDate);

          // Remplir le champ de date de fin
          if (this.hasEndDateTarget) {
            this.endDateTarget.value = formattedEndDate;
          }
        }
      }
    });
  }

  // Fonction utilitaire pour formater une date au format Y-m-d
  formatDate(date) {
    const year = date.getFullYear();
    const month = String(date.getMonth() + 1).padStart(2, '0');
    const day = String(date.getDate()).padStart(2, '0');
    return `${year}-${month}-${day}`;
  }
}
