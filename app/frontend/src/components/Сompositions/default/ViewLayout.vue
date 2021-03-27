<template>
    <BaseLayout>
        <template v-slot:header>{{ this.App.value.appHeader }}</template>
        <template v-slot:main>
            <slot></slot>
        </template>
        <template v-slot:footer>Footer</template>
    </BaseLayout>
</template>

<script>
export default {
    name: 'ViewLayout',
    inject: ['App'],
}
</script>

<style scoped></style>
