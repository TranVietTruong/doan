<template>
    <div>
        <v-row>
            <v-col cols='12'>

            
                <v-card
                    class="mb-5"
                    v-for="question in listQuestion"
                    max-width="100%"
                    outlined
                >
                    <v-list-item>
                        <v-list-item-avatar dense size="30" :color="question.avatar ? '':'primary'">
                            <img v-if="question.avatar"  :src="question.avatar">
                            <span v-if="!question.avatar" class="white--text subtitle-2">
                                {{question.full_name.substr(0,2)}}
                            </span>
                        </v-list-item-avatar>
                        <v-list-item-content>
                            <v-list-item-title class="font-weight-bold subtitle-2">{{question.full_name}}</v-list-item-title>
                            <v-list-item-subtitle class="font-weight-thin caption">{{question.time}}</v-list-item-subtitle>
                        </v-list-item-content>
                    </v-list-item>
                    
                    <v-list-item three-line>
                        <v-list-item-content>
                            <v-list-item-title class=".subtitle-2	 mb-3 text-wrap">
                                {{question.content}}
                            </v-list-item-title>
                            <v-list-item-subtitle>
                                <v-chip
                                    v-for="item in question.tag"
                                    class="ma-1"
                                    color="grey darken-1"
                                    label
                                    text-color="white"
                                    small
                                    
                                >
                                    <v-icon small left>mdi-tag</v-icon>
                                    {{item.text}}
                                </v-chip>
                            </v-list-item-subtitle>

                            <div class="d-flex justify-end">
                                <p> {{question.num_answer}} câu trả lời</p>
                            </div>
                        </v-list-item-content>
                    </v-list-item>
                    <VDivider/>
                    <v-card-actions>
                        <VTooltip top color="primary">
                            <template v-slot:activator="{on}">
                                <v-btn
                                    @click="likeQuestion(question)"
                                    small
                                    v-on="on"
                                    class="mr-2">
                                <VIcon
                                    :color="question.liked ? 'primary':''"
                                    small
                                    left>mdi-thumb-up </VIcon>{{question.num_like}}
                                </v-btn>
                            </template>
                            <span> Like </span>
                        </VToolTip>  

                        <VTooltip top color="primary">
                            <template v-slot:activator="{on}">      
                                <v-btn
                                    @click="dislikeQuestion(question)"
                                    small
                                    v-on="on"
                                    class="mr-2">
                                    {{question.num_dislike}}
                                    <VIcon
                                        :color="question.disliked ? 'primary':''"
                                        small
                                        right>mdi-thumb-down </VIcon>
                                </v-btn>
                            </template>
                            <span> Dislike </span>
                        </VToolTip>

                        <VTooltip top color="pink">
                            <template v-slot:activator="{on}">     
                                <v-btn
                                    @click="favorite(question)"
                                    small
                                    v-on="on"
                                    class="mr-2">
                                    <VIcon
                                        :color="question.favorited ? 'pink':''"
                                        small>mdi-cards-heart</VIcon></v-btn>
                            </template>
                            <span>Yêu thích</span>
                        </VToolTip>    
                        
                        <VTooltip top color="success">
                            <template v-slot:activator="{on}">     
                                <v-btn :to="'/dien-dan/'+question.slug" small v-on="on"> <VIcon small>mdi-comment</VIcon></v-btn>
                            </template>
                            <span> Trả lời</span>
                        </VToolTip>        
                    </v-card-actions>
                </v-card>

                <div class="d-flex justify-center">
                    <v-btn 
                        v-if="loadMore"
                        rounded
                        outlined
                        small
                        
                        @click="getQuestion">Xem thêm</v-btn>   
                </div>
            </v-col>
        </v-row>
    </div>
</template>

<script>
    import {eventBus} from "../../app";

    export default {
    data(){
        return{
            listQuestion: [],
            page: 0,
            loadMore: true
        }
    },
    methods:{
        getQuestion()
        {

            switch (this.$store.state.current) 
            {
                case 'latest':
                    axios({
                        method: 'post',
                        url: 'api/question/getQuestion',
                        data:{
                            page: this.page
                        }
                    }).then(response=>{
                        if(response.data.length < 4)
                            this.loadMore = false;
                        else
                            this.loadMore = true;

                        if(response.data.length)
                        {
                            for(let i=0; i<response.data.length;i++)
                            {
                                response.data[i].tag = JSON.parse(response.data[i].tag);
                            }
                            this.listQuestion.push(...response.data);
                            this.page += 4;
                        }
                    
                    }).catch(error=>{
                    
                    });
                    break;

                case 'notanswer':
                    axios({
                        method: 'post',
                        url: 'api/question/getQuestionNotAnswer',
                        data:{
                            page: this.page
                        }
                    }).then(response=>{
                        if(response.data.length < 4)
                            this.loadMore = false;
                        else
                            this.loadMore = true;

                        if(response.data.length)
                        {
                            for(let i=0; i<response.data.length;i++)
                            {
                                response.data[i].tag = JSON.parse(response.data[i].tag);
                            }
                            this.listQuestion.push(...response.data);
                            this.page += 4;                           
                        }
                    
                    }).catch(error=>{
                       
                    });
                    break;    

                case 'hasanswer':
                    axios({
                        method: 'post',
                        url: 'api/question/getQuestionHasAnswer',
                        data:{
                            page: this.page
                        }
                    })
                    .then(response=>{
                        if(response.data.length < 4)
                            this.loadMore = false;
                        else
                            this.loadMore = true;

                        if(response.data.length)
                        {
                            for(let i=0; i<response.data.length;i++)
                            {
                                response.data[i].tag = JSON.parse(response.data[i].tag);
                            }
                            this.listQuestion.push(...response.data);
                            this.page += 4;                           
                        }
                        
                    })
                    .catch(error=>{
                        
                    });

                    break;  

                case 'favorite':
                    axios({
                        method: 'post',
                        url: 'api/question/getFavorite',
                        data:{
                            page: this.page
                        }
                    }).then(response=>{

                        if(response.data.length < 4)
                            this.loadMore = false;
                        else
                            this.loadMore = true;

                        if(response.data.length)
                        {
                            for(let i=0; i<response.data.length;i++)
                            {
                                response.data[i].tag = JSON.parse(response.data[i].tag);
                            }
                            this.listQuestion.push(...response.data);
                            this.page += 4;
                        }
                        
                    })
                    .catch(error=>{
                       
                    });

                    break;

                case 'highlight':
                    axios({
                        method: 'post',
                        url: 'api/question/getHighLight',
                        data:{
                            page: this.page
                        }
                    }).then(response=>{

                        if(response.data.length < 4)
                            this.loadMore = false;
                        else
                            this.loadMore = true;

                        if(response.data.length)
                        {
                            for(let i=0; i<response.data.length;i++)
                            {
                                response.data[i].tag = JSON.parse(response.data[i].tag);
                            }
                            this.listQuestion.push(...response.data);
                            this.page += 4;
                        }
                        
                    })
                    .catch(error=>{
                       
                    });
                    break; 

                case 'vote':
                    axios({
                        method: 'post',
                        url: 'api/question/getVote',
                        data:{
                            page: this.page
                        }
                    }).then(response=>{

                        if(response.data.length < 4)
                            this.loadMore = false;
                        else
                            this.loadMore = true;

                        if(response.data.length)
                        {
                            for(let i=0; i<response.data.length;i++)
                            {
                                response.data[i].tag = JSON.parse(response.data[i].tag);
                            }
                            this.listQuestion.push(...response.data);
                            this.page += 4;
                        }
                        
                    })
                    .catch(error=>{
                       
                    });
                    break;          
                case 'inday':
                    axios({
                        method: 'post',
                        url: 'api/question/getInDay',
                        data:{
                            page: this.page
                        }
                    }).then(response=>{

                        if(response.data.length < 4)
                            this.loadMore = false;
                        else
                            this.loadMore = true;

                        if(response.data.length)
                        {
                            for(let i=0; i<response.data.length;i++)
                            {
                                response.data[i].tag = JSON.parse(response.data[i].tag);
                            }
                            this.listQuestion.push(...response.data);
                            this.page += 4;
                        }
                        
                    })
                    .catch(error=>{
                       
                    });
                    break;
                case 'inweek':
                    axios({
                        method: 'post',
                        url: 'api/question/getInWeek',
                        data:{
                            page: this.page
                        }
                    }).then(response=>{

                        if(response.data.length < 4)
                            this.loadMore = false;
                        else
                            this.loadMore = true;

                        if(response.data.length)
                        {
                            for(let i=0; i<response.data.length;i++)
                            {
                                response.data[i].tag = JSON.parse(response.data[i].tag);
                            }
                            this.listQuestion.push(...response.data);
                            this.page += 4;
                        }
                        
                    })
                    .catch(error=>{
                       
                    });
                    break;
                case 'inmonth':
                    axios({
                        method: 'post',
                        url: 'api/question/getInMonth',
                        data:{
                            page: this.page
                        }
                    }).then(response=>{

                        if(response.data.length < 4)
                            this.loadMore = false;
                        else
                            this.loadMore = true;

                        if(response.data.length)
                        {
                            for(let i=0; i<response.data.length;i++)
                            {
                                response.data[i].tag = JSON.parse(response.data[i].tag);
                            }
                            this.listQuestion.push(...response.data);
                            this.page += 4;
                        }
                        
                    })
                    .catch(error=>{
                       
                    });
                    break;
                default:
                    // statements_def
                    break;
            };
        },

        //===================================================================================
        likeQuestion(question)
        {
            let action;
            if(question.liked)
            {
                action = 'unlike';
                question.num_like -= 1;
                question.liked = false;
            }
            else
            {
                action = 'like';
                question.num_like += 1;
                question.liked = true;
                if(question.disliked)
                {
                    question.disliked = false;
                    question.num_dislike -= 1;
                }
            }

            axios({
                method: 'post',
                url: 'api/question/likeQuestion',
                data:{
                    action: action,
                    id_question: question.id,
                }
            });

        },
        dislikeQuestion(question)
        {
            let action;
            if(question.disliked)
            {
                action = 'undislike';
                question.num_dislike -= 1;
                question.disliked = false;
            }
            else
            {
                action = 'dislike';
                question.num_dislike += 1;
                question.disliked = true;
                if(question.liked)
                {
                    question.liked = false;
                    question.num_like -= 1;
                }
            }

            axios({
                method: 'post',
                url: 'api/question/dislikeQuestion',
                data:{
                    action: action,
                    id_question: question.id,
                }
            });
        },
        favorite(question)
        {
            let action;
            if(question.favorited)
            {
                action = 'unfavorite';
                question.favorited = false;
            }
            else
            {
                action = 'favorite';
                question.favorited = true;
            }

            axios({
                method: 'post',
                url: 'api/question/favorite',
                data:{
                    action: action,
                    id_question: question.id,
                }
            });
        },
        //================================================================================================
    },
    mounted()
    {
        this.getQuestion();
    },
    created()
    {
        eventBus.$on('change',(data)=>{
            if(data.length < 4)
                this.loadMore = false;
            else
                this.loadMore = true;

            this.listQuestion = data;
            this.page = data.length;
        
        });
    }
};
</script>

<style>
    
</style>