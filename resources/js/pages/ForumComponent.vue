<template>
    <div>
        <VNavigationDrawer mini-variant app class='my-nav'>
            <VList>
                <VTooltip right color="#000">
                    <template v-slot:activator="{on }">
                        <VListItem v-on="on"> 
                            <VBtn 
                                :to="'/dien-dan'"
                                active-class="active"
                                exact
                                medium  
                                :class="['mb-2',{'active': hasRoute('/dien-dan') }]">
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
                                class="mb-2">
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
                            <VBtn medium link class="mb-2" >
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

        <VNavigationDrawer color="#595757" app left  class="ml-12">
            
                <div class="bg-user">
                    <v-list-item two-line>
                        <v-badge
                            bordered
                            bottom
                            overlap
                            color="green"
                            offset-x="26"
                            offset-y="32"
                        >
                            <v-list-item-avatar :color="$store.state.user.avatar ? '':'primary'">
                                <img v-if="$store.state.user.avatar"  :src="$store.state.user.avatar">
                                <span v-if="!$store.state.user.avatar" class="white--text subtitle-2">
                                    {{$store.state.user.full_name.substr(0,2)}}
                                </span>
                            </v-list-item-avatar>
                        </v-badge>

                        <v-list-item-content>
                            <v-list-item-title v-if="authenticated">{{$store.state.user.full_name}}</v-list-item-title>
                            <v-list-item-subtitle>#6548778</v-list-item-subtitle>
                        </v-list-item-content>

                       

                        <v-list-item-action>
                            <v-btn icon @click="log_out">
                                <v-icon>mdi-logout</v-icon>
                            </v-btn>
                        </v-list-item-action>
                
                    </v-list-item>
                </div>

            <v-list-item-group color="green">
                <VList rounded dense >
                    <v-subheader># Tùy chọn</v-subheader>
                  
                    <v-list-item @click="notAnswer">
                        <v-list-item-icon>
                            <v-icon>mdi-help-rhombus-outline</v-icon>
                        </v-list-item-icon>
                        <v-list-item-content>
                            <v-list-item-title>Chưa có câu trả lời</v-list-item-title>
                        </v-list-item-content>
                    </v-list-item>
                    <v-list-item @click="hasAnswer">
                        <v-list-item-icon> 
                            <v-icon>mdi-help-rhombus</v-icon>
                        </v-list-item-icon>
                        <v-list-item-content>
                            <v-list-item-title>Đã có câu trả lời</v-list-item-title>
                        </v-list-item-content>
                    </v-list-item>
                    <v-list-item @click="favorite">
                        <v-list-item-icon>
                            <v-icon>mdi-cards-heart</v-icon>
                        </v-list-item-icon>
                        <v-list-item-content>
                            <v-list-item-title>Câu hỏi yêu thích</v-list-item-title>
                        </v-list-item-content>
                    </v-list-item>  
                </VList>
 
                <VList rounded dense>
                    <v-subheader># Câu hỏi</v-subheader>
                    <v-list-item @click="highlight">
                        <v-list-item-icon>
                            <v-icon>mdi-layers-plus</v-icon>
                        </v-list-item-icon>
                        <v-list-item-content>
                            <v-list-item-title>Câu hỏi nổi bật</v-list-item-title>
                        </v-list-item-content>
                    </v-list-item>
                    <v-list-item @click="vote">
                        <v-list-item-icon>
                            <v-icon>mdi-eye-check</v-icon>
                        </v-list-item-icon>
                        <v-list-item-content>
                            <v-list-item-title>Vote nhiều</v-list-item-title>
                        </v-list-item-content>
                    </v-list-item>
                </VList>

                <VList rounded dense>
                    <v-subheader># Thời gian</v-subheader>
             
                    <v-list-item @click="latest">
                        <v-list-item-icon>
                            <v-icon>mdi-timer-sand</v-icon>
                        </v-list-item-icon>
                        <v-list-item-content>
                            <v-list-item-title>Mới nhất</v-list-item-title>
                        </v-list-item-content>
                    </v-list-item>
                    <v-list-item @click="inDay">
                        <v-list-item-icon>
                            <v-icon>mdi-clock-outline</v-icon>
                        </v-list-item-icon>
                        <v-list-item-content>
                            <v-list-item-title>Trong ngày</v-list-item-title>
                        </v-list-item-content>
                    </v-list-item>
                    <v-list-item @click="inWeek">
                        <v-list-item-icon>
                            <v-icon>mdi-calendar-clock</v-icon>
                        </v-list-item-icon>
                        <v-list-item-content>
                            <v-list-item-title>Trong tuần</v-list-item-title>
                        </v-list-item-content>
                    </v-list-item>
                    <v-list-item @click="inMonth">
                        <v-list-item-icon>
                            <v-icon>mdi-calendar-month</v-icon>
                        </v-list-item-icon>
                        <v-list-item-content>
                            <v-list-item-title>Trong tháng</v-list-item-title>
                        </v-list-item-content>
                    </v-list-item>
                </VList>
            </v-list-item-group>
        </VNavigationDrawer> 
    

        <VNavigationDrawer app clipped right v-model="drawer2">
            <VList dense>
                <VSubheader># Có thể bạn biết</VSubheader>
                
                <div v-for="question in questionRandom">
                    <div class="d-flex ma-2 ml-3 caption">
                        
                        <router-link
                            tag="a"
                            :to="'/dien-dan/'+question.slug"
                        >
                            {{question.content}}
                        </router-link>
                        <!-- <a href="">{{question.content}}</a>   -->
                    </div>
                    <VDivider/> 
                </div>
            
            </VList>

            <VList rounded dense>
                <v-subheader># Thẻ tags</v-subheader>
                <div class="tags">
                    <v-chip
                        v-for="tag in tags"
                        class="ma-1"
                        color="green darken-2"
                        label
                        text-color="white"
                        small
                        link
                    >
                        <v-icon small left>mdi-tag</v-icon>
                        {{tag.name_tag}}
                    </v-chip>


                </div>
            </VList>
        </VNavigationDrawer>
        
        <v-app-bar app clipped-right dark  >
    
            <v-row>
                <v-col cols='9' offset='1'>
                    <v-menu
                        bottom
                        origin="bottom"
                        offset-y
                        max-height="60vh"
                        transition="scale-transition"
                        :close-on-click="closeOnContentClick"
                        :close-on-content-click="closeOnContentClick"
                        > 
                        <template v-slot:activator="{ on }">
                            <v-text-field
                                class="ml-12"
                                v-model="key"
                                @keyup="search"
                                v-on="on"
                                solo-inverted
                                flat
                                hide-details
                                height="30px"
                                label="Search"
                                append-icon="mdi-magnify"
                            />
                        </template>

                        <v-card>
                            <div v-for="question in questionSearch">
                                <div class="d-flex ma-2 ml-3 caption">
                                    
                                    <router-link
                                        tag="a"
                                        :to="'/dien-dan/'+question.slug"
                                    >
                                        {{question.content}}
                                    </router-link>
                                    <!-- <a href="">{{question.content}}</a>   -->
                                </div>
                                <VDivider/> 
                            </div>
                        </v-card>
                    </v-menu> 
                </v-col>
            </v-row>

            

            <VBtn 
                
                small
                to="/dien-dan/dat-cau-hoi">
                Đặt câu hỏi
            </VBtn>
           
            <VBtn fab icon class="ml-3">
                <VIcon>mdi-account</VIcon>
            </VBtn>  

            <VBtn fab  icon>
                <VIcon>mdi-bullseye</VIcon>
            </VBtn>     

            <VBtn fab  icon @click.stop="drawer2 = !drawer2" class="mr-2">
                <v-icon >mdi-dots-horizontal</v-icon>
            </VBtn>
            
        
            <!-- <v-app-bar-nav-icon @click.stop="drawer2 = !drawer2" /> -->
        </v-app-bar>
        
        <v-content>
            <vContainer>
                <router-view></router-view>
            </vContainer>
        </v-content> 
    </div>

</template>

<script>
    import {mapGetters,mapActions} from 'vuex';
    import {eventBus} from '../app.js';
    export default {
        data(){
            return {
                drawer2: true,
                expand: false,
                current:'moinhat',
                tags: [],
                questionRandom: [],
                key: '',
                questionSearch: [],

                closeOnClick: false,
                closeOnContentClick: true,

            }
        },
        methods:{
            ...mapActions(['logout']),
            log_out(){
                this.logout().then(()=>{
                    this.$router.push({name:'login'});
                });
            },
            notAnswer()
            {
                
                axios({
                method: 'post',
                url: 'api/question/getQuestionNotAnswer',
                data:{
                    page: 0
                }
                }).then(response=>{

                    if(response.data.length)
                    {
                        for(let i=0; i<response.data.length;i++)
                        {
                            response.data[i].tag = JSON.parse(response.data[i].tag);
                        }
                    }

                    this.$store.state.current = 'notanswer';
                    eventBus.$emit('change',response.data);
                })
            },
            hasAnswer()
            {
                axios({
                method: 'post',
                url: 'api/question/getQuestionHasAnswer',
                data:{
                    page: 0
                }
                }).then(response=>{

                    if(response.data.length)
                    {
                        for(let i=0; i<response.data.length;i++)
                        {
                            response.data[i].tag = JSON.parse(response.data[i].tag);
                        }
                    }

                    this.$store.state.current = 'hasanswer';
                    eventBus.$emit('change',response.data);
                })
            },
            favorite()
            {
                axios({
                method: 'post',
                url: 'api/question/getFavorite',
                data:{
                    page: 0
                }
                }).then(response=>{

                    if(response.data.length)
                    {
                        for(let i=0; i<response.data.length;i++)
                        {
                            response.data[i].tag = JSON.parse(response.data[i].tag);
                        }
                    }

                    this.$store.state.current = 'favorite';
                    eventBus.$emit('change',response.data);
                })
            },
            highlight()
            {
                axios({
                method: 'post',
                url: 'api/question/getHighLight',
                data:{
                    page: 0
                }
                }).then(response=>{

                    if(response.data.length)
                    {
                        for(let i=0; i<response.data.length;i++)
                        {
                            response.data[i].tag = JSON.parse(response.data[i].tag);
                        }
                    }

                    this.$store.state.current = 'highlight';
                    eventBus.$emit('change',response.data);
                })
            },
            vote()
            {
                axios({
                method: 'post',
                url: 'api/question/getVote',
                data:{
                    page: 0
                }
                }).then(response=>{

                    if(response.data.length)
                    {
                        for(let i=0; i<response.data.length;i++)
                        {
                            response.data[i].tag = JSON.parse(response.data[i].tag);
                        }
                    }

                    this.$store.state.current = 'vote';
                    eventBus.$emit('change',response.data);
                })
            },
            latest()
            {
                axios({
                method: 'post',
                url: 'api/question/getQuestion',
                data:{
                    page: 0
                }
                }).then(response=>{

                    if(response.data.length)
                    {
                        for(let i=0; i<response.data.length;i++)
                        {
                            response.data[i].tag = JSON.parse(response.data[i].tag);
                        }
                    }

                    this.$store.state.current = 'latest';
                    eventBus.$emit('change',response.data);
                })
            },
            inDay()
            {
                axios({
                method: 'post',
                url: 'api/question/getInDay',
                data:{
                    page: 0
                }
                }).then(response=>{

                    if(response.data.length)
                    {
                        for(let i=0; i<response.data.length;i++)
                        {
                            response.data[i].tag = JSON.parse(response.data[i].tag);
                        }
                    }

                    this.$store.state.current = 'inday';
                    eventBus.$emit('change',response.data);
                })
            },
            inWeek()
            {
                axios({
                method: 'post',
                url: 'api/question/getInWeek',
                data:{
                    page: 0
                }
                }).then(response=>{

                    if(response.data.length)
                    {
                        for(let i=0; i<response.data.length;i++)
                        {
                            response.data[i].tag = JSON.parse(response.data[i].tag);
                        }
                    }

                    this.$store.state.current = 'inweek';
                    eventBus.$emit('change',response.data);
                })
            },
            inMonth()
            {
                axios({
                method: 'post',
                url: 'api/question/getInMonth',
                data:{
                    page: 0
                }
                }).then(response=>{

                    if(response.data.length)
                    {
                        for(let i=0; i<response.data.length;i++)
                        {
                            response.data[i].tag = JSON.parse(response.data[i].tag);
                        }
                    }

                    this.$store.state.current = 'inmonth';
                    eventBus.$emit('change',response.data);
                })
            },

            getTag()
            {
                axios({
                    method: 'post',
                    url: 'api/tags/getAll',
                })
                .then(response=>{

                    this.tags = response.data;
                })
            },
            getRandom()
            {
                axios({
                    method: 'post',
                    url: 'api/question/getRandom',
                })
                .then(response=>{

                    this.questionRandom = response.data;
                })
            },
            hasRoute(partial) 
            {
                return (this.$route.path.indexOf(partial) > -1)
            },
            search()
            {
                 axios({
                    method: 'post',
                    url: 'api/question/search',
                    data:{
                        key: this.key
                    }
                })
                .then(response=>{
                    if(response.data.length)
                        this.questionSearch = response.data;
                })
            }
        },
        computed:{
            ...mapGetters(['authenticated','user']),

        },
        created(){
            this.getTag();
            this.getRandom();
        }
        
    };
</script>

<style scoped>
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