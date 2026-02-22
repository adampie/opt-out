# No environment variable telemetry opt-out available.
# Vue CLI (@vue/cli) and create-vue do not appear to collect telemetry data.
# Unlike frameworks like Next.js or Nuxt, Vue CLI has no documented telemetry
# collection or opt-out mechanism. The Vue ecosystem relies on Nuxt for
# telemetry collection, which has its own separate opt-out variable.
{
  name = "vue";
  meta = {
    description = "Vue.js CLI tooling";
    homepage = "https://github.com/vuejs/vue-cli";
    documentation = "https://cli.vuejs.org/guide/";
  };
  variables = { };
}
