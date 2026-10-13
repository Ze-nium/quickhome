import QtQuick 
import qs.Auxiliary

Text {
  id: clockWidgetText
  required property var fontSize
  readonly property int animDuration: 10000
  readonly property string timeOfDay: {
    let currentTime = Time.time.split(" ");
    let currentHour = parseInt(currentTime[0], 10);
    let currentMinute = parseInt(currentTime[1], 10);
    if (currentHour < 7 && currentHour >= 0) return "midnight" // Midnight
    else if (currentHour >= 20) return "night"; // Night time
    else if (currentHour >= 18 && currentHour < 20) return "sunset"; // Sunset 
    else if (currentHour >= 12 && currentHour < 18) return "afternoon" // Afternoon
    else if (currentHour >= 7 && currentHour < 12) return "morning" // Morning
  }

  states: [
    State {
      name: "MIDNIGHT"
      when: timeOfDay == "midnight"
      PropertyChanges { clockWidgetText.color: "#ff4872FB" }
    },
    State {
      name: "MORNING"
      when: timeOfDay == "morning"
      PropertyChanges { clockWidgetText.color: "#ffFF9756" }
    },
    State {
      name: "AFTERNOON"
      when: timeOfDay == "afternoon"
      PropertyChanges { clockWidgetText.color: "#ffFFF36C" }
    },
    State {
      name: "SUNSET"
      when: timeOfDay == "sunset"
      PropertyChanges { clockWidgetText.color: "#ffFFAE00" }
    },
    State {
      name: "NIGHT"
      when: timeOfDay == "night"
      PropertyChanges { clockWidgetText.color: "#ff675CFF" }
    }
  ]

  transitions: [
    Transition {
      from: "NIGHT"
      to: "MIDNIGHT"
      ColorAnimation { target: clockWidgetText; duration: animDuration }
    },
    Transition {
      from: "MIDNIGHT"
      to: "MORNING"
      ColorAnimation { target: clockWidgetText; duration: animDuration }
    },
    Transition {
      from: "MORNING"
      to: "AFTERNOON"
      ColorAnimation { target: clockWidgetText; duration: animDuration }
    },
    Transition {
      from: "AFTERNOON"
      to: "SUNSET"
      ColorAnimation { target: clockWidgetText; duration: animDuration }
    },
    Transition {
      from: "SUNSET"
      to: "NIGHT"
      ColorAnimation { target: clockWidgetText; duration: animDuration }
    }
  ]


  // color: {
  //   let currentTime = Time.time.split(" ");
  //   let currentHour = parseInt(currentTime[0], 10);

    // console.log("ClockWidget: The current time is:", currentTime);

    // Add color transitions
    // For midnight hours, inverse the logic.
    // if (currentHour < 7 && currentHour >= 0) return "midnight" // Midnight
    // else if (currentHour >= 18 && currentHour < 20) return "sunset"; // Sunset 
    // else if (currentHour >= 7 && currentHour < 12) return "morning" // Morning
    // else if (currentHour >= 12 && currentHour < 18) return "afternoon" // Afternoon
    // else if (currentHour >= 20) return "night"; // Night time
    // else return "#ff000000"
  // }

  text: Time.time
  font.pointSize: fontSize 
  font.family: "Open Sans"
  font.weight: Font.Light
}
