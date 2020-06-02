<template lang="">
    <div>
        <VNavigationDrawer mini-variant app class='my-nav'>
            <VList>
                <VTooltip right color="#000">
                    <template v-slot:activator="{on }">
                        <VListItem v-on="on"> 
                            <VBtn 
                                :to="'/dien-dan'"
                                active-class="active"
                                medium  
                                class='mb-2'>
                                <VIcon>mdi-forum</VIcon>
                            </VBtn>

                        </VListItem>
                    </template>
                    <span>Diễn đàn</span>
                </VTooltip>
                
                <VTooltip right color="#000">
                    <template v-slot:activator="{on}">
                        <VListItem v-on="on">
                            <VBtn 
                                :to="'/tin-tuc'"
                                active-class="active"
                                medium  
                                exact
                                :class="['mb-2',{'active': hasRoute('/tin-tuc') }]">
                                <VIcon>mdi-television-classic</VIcon>
                            </VBtn>
                        </VListItem>
                    </template>    
                    <span>Tin tức</span>
                </VTooltip> 

                <VTooltip right color="#000">
                    <template v-slot:activator="{on}">
                        <VListItem v-on="on">
                            <VBtn 
                                :to="'/tu-van'"
                                active-class="active" 
                                medium 
                                link 
                                class="mb-2" >
                                <VIcon>mdi-book-open-page-variant</VIcon>
                            </VBtn>
                        </VListItem>
                    </template>    
                    <span>Pháp luật</span>
                </VTooltip> 

                <VTooltip right color="#000">
                    <template v-slot:activator="{on}">
                        <VListItem v-on="on">
                            <VBtn 
                                medium 
                                link 
                                class="mb-2" >
                                <VIcon>mdi-contact-mail</VIcon>
                            </VBtn>
                        </VListItem>
                    </template>    
                    <span>Liên hệ</span>
                </VTooltip> 

                <VTooltip right color="#000">
                    <template v-slot:activator="{on}">
                        <VListItem v-on="on">
                            <VBtn medium link class="mb-2" >
                                <VIcon>mdi-settings</VIcon>
                            </VBtn>
                        </VListItem>
                    </template>    
                    <span>Cài đặt</span>
                </VTooltip> 
            </VList>
        </VNavigationDrawer>

        <v-content>
            <router-view></router-view> 
        </v-content> 
    </div>

</template>

<script>
    export default {
        data(){
            return{

            }
        },
        methods:{
            hasRoute(partial) 
            {
                return (this.$route.path.indexOf(partial) > -1)
            },
        }
    };
</script>

<style >
    .v-text-field.v-text-field--solo .v-input__control {
        min-height: 25px;
        padding: 0;
    }
    
    .v-application nav.ml-12 {
        margin-left: 80px!important;
    }
    .bg-user{
        background: #434343;
        height: 65px;
    }
    .v-application--is-ltr .v-list-item__avatar:first-child {
        margin-right: 10px;
    }
    .v-application--is-ltr .bg-user .v-list-item__avatar:last-of-type:not(:only-child){
        margin-left: 0px;
    }

    .v-application--is-ltr .bg-user .v-list-item__action:last-of-type:not(:only-child){
        margin-left: 0px;
    }
    
    .bg-user .v-list-item__title {
        align-self: center;
        font-size: 0.9rem;
        font-weight: bold;
    }
    .bg-user .v-list-item__subtitle {
        font-size: .8rem;
    }
    .v-badge__badge {
        height: 15px;
        min-width: 15px;
    }
    .my-nav .v-btn:not(.v-btn--round).v-size--default {
        height: 64px;
        min-width: 64px;
        padding: 0 16px;
    }
    .my-nav .v-list-item:hover .v-btn {
        background-color: #2E7D32 !important;
        border-color:#2E7D32 !important;
    }
    
    .my-nav .v-list-item:hover .v-btn:not(.v-btn--round).v-size--default {
        transition: all .3s linear;
        border-radius: 20px;
    }

    .active{
        background-color: #2E7D32 !important;
        border-color:#2E7D32 !important;
        border-radius: 20px;
    }

    .v-navigation-drawer__content::-webkit-scrollbar-track,::-webkit-scrollbar-track
    {
        -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
        border-radius: 5px;
        background-color: #F5F5F5;
    }

    .v-navigation-drawer__content::-webkit-scrollbar, ::-webkit-scrollbar
    {
        width: 5px;
        background-color: #F5F5F5;
    }

    .v-navigation-drawer__content::-webkit-scrollbar-thumb, ::-webkit-scrollbar-thumb
    {
        border-radius: 5px;
        -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,.3);
        background-color: #555;
    }
    .text-wrap{
        white-space: normal !important;
    }

    hr{
        margin-top: 0 !important;
        margin-bottom: 0 !important;
    }
</style>