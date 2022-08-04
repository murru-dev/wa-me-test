<script setup>
import { computed, ref } from 'vue'

const phoneNumber = ref('')
const disabledBtn = computed(() => { return phoneNumber.value === '' })

function startChat() {
  window.open(`https://wa.me/${phoneNumber.value}`, '_blank')
}
</script>

<template>
  <input
    type="text"
    name="wa-me-number"
    id="waMeNumber"
    placeholder="Number without +, 0 or country code"
    class="waMeNumber"
    v-model="phoneNumber"
  >
  <br><br>
  <button
    type="button"
    @click="startChat"
    :class="{disabledButton: disabledBtn}"
    :disabled="disabledBtn"
  >Start chat</button>
</template>

<style scoped>
.waMeNumber {
  width: 300px;
  padding: 10px;
}

.disabledButton {
  background-color: grey;
  color: white;
}
</style>
