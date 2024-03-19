<script setup>
import { computed, ref } from "vue";

const phoneNumber = ref("");
const disabledBtn = computed(() => {
  return phoneNumber.value === "";
});

function NumbersOnly($evt) {
  $evt = $evt ? $evt : window.event;
  var charCode = $evt.which ? $evt.which : $evt.keyCode;
  if (
    charCode > 31 &&
    (charCode < 48 || charCode > 57) &&
    charCode !== 46 &&
    charCode !== 43
  ) {
    $evt.preventDefault();
  } else {
    return true;
  }
}

function startChat() {
  window.open(`https://wa.me/${phoneNumber.value}`, "_blank");
}
</script>

<template>
  <p class="copyright">
    <bold>
      Developed by
      <a
        href="https://www.linkedin.com/in/murrugarra/"
        target="_blank"
        class="link"
      >
        Eng. Ernesto Murrugarra
      </a>
    </bold>
  </p>
  <div class="example">
    <label for="wa-me-number">Write number here:</label>
    <input
      type="tel"
      name="wa-me-number"
      id="waMeNumber"
      placeholder="Ex: +58412xxxxxxx"
      class="waMeNumber"
      @keypress="NumbersOnly"
      v-model="phoneNumber"
    />
    <br /><br />
    <button
      type="button"
      @click="startChat"
      :class="{ disabledButton: disabledBtn }"
      :disabled="disabledBtn"
    >
      Start chat
    </button>
  </div>
  <div class="presentation">
    <h1 class="title"><i class="fa-brands fa-whatsapp"></i> Whatsapp Me!</h1>
    <p class="description">Just write a valid number to start</p>
    <p class="description">a chat on whatsapp.</p>
    <p class="description">Enjoy!</p>
  </div>
</template>

<style>
#app {
  display: flex;
  flex-direction: row;
  height: 100vh;
  width: 100vw;
}

#app > div {
  display: flex;
  flex-direction: column;
  gap: 1em;
  justify-content: center;
  align-items: center;
  width: 50%;
}

.copyright {
  color: #ffff;
  font-size: 1em;
  padding: 1em;
  position: absolute;
}

.link {
  color: #ffff;
  text-decoration: none;
}

.example label {
  color: rgba(61, 180, 76, 1);
  font-size: 1.5em;
}

.presentation {
  background-color: rgba(61, 180, 76, 1);
  color: #ffff;
}

.title {
  font-size: 3em;
  padding-bottom: 1em;
}

.description {
  font-size: 1.5em;
}

button {
  border-radius: 8px;
  border: 1px solid transparent;
  color: #000000;
  padding: 0.6em 1.2em;
  font-size: 1.3em;
  font-weight: 500;
  font-family: inherit;
  background-color: rgba(61, 180, 76, 1);
  cursor: pointer;
  transition: border-color 0.25s;
  transition: 1s;
}
button:hover {
  background-color: rgba(72, 211, 90, 1);
  border-color: #242424;
}
button:focus,
button:focus-visible {
  outline: 4px auto -webkit-focus-ring-color;
}

.waMeNumber {
  border-radius: 20px;
  font-size: 1.5em;
  padding: 0.5em;
  width: 300px;
}

.disabledButton,
.disabledButton:hover {
  background-color: grey;
  color: white;
}

@media (max-width: 991px) {
  .copyright {
    font-size: 0.9em;
  }
  .title {
    font-size: 2.5em;
  }
  .example label,
  .description {
    font-size: 1.3em;
  }
  button,
  .waMeNumber {
    font-size: 1em;
  }
}

@media (max-width: 573px) {
  #app {
    flex-direction: column;
  }
  #app > div {
    height: 50%;
    width: 100%;
  }
  .copyright {
    font-size: 0.8em;
    left: 0;
    right: 0;
    margin-left: auto;
    margin-right: auto;
    width: fit-content;
  }
  .title {
    font-size: 2em;
  }
  .example label,
  .description {
    font-size: 1.2em;
  }
  button,
  .waMeNumber {
    font-size: 1em;
  }
}
</style>
