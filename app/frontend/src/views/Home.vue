<template>
    <ViewLayout>
        Home
    </ViewLayout>
</template>

<script>
export default {
    name: 'Home',
    inject: ['App'],
    async created() {
        this.$nextTick(() => this.App.value.title = 'Home');
        let res = await this.$api.Get('/test').ready();
        let data = await res.json();
        console.log(data.ok);
    },
}
</script>
