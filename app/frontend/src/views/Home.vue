<template>
    <ViewLayout>
        Home
    </ViewLayout>
</template>

<script>
export default {
    name: 'Home',
    inject: ['App'],
    created() {
        this.$nextTick(() => this.App.value.title = 'Home')
        this.$api = this.App.value.helpers.$api
    },
}
</script>
