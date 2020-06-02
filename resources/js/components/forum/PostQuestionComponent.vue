<template>
    <div>
        <v-row>
            <v-col cols='12'>

                <v-stepper v-model="step" vertical>
                    <v-stepper-step :complete="step > 1" step="1">
                        Đặt câu hỏi
                    </v-stepper-step>

                    <v-stepper-content step="1">
                        <v-card
                                class="mb-5"
                                max-width="100%"
                                outlined
                        >
                            <v-form v-model="formValid">
                                <div class="ma-3">
                                    <v-textarea
                                            v-model="question"
                                            :rules="[
                                                () => !!question || 'Nhập nội dung câu hỏi',
                                            ]"
                                            outlined
                                            name="input-7-4"
                                            label="Câu hỏi"
                                    ></v-textarea>


                                    <v-combobox

                                            v-model="tags"
                                            :filter="filter"
                                            :hide-no-data="!search"
                                            :items="items"
                                            :search-input.sync="search"
                                            hide-selected
                                            label="Nhập thẻ tag"
                                            multiple
                                            small-chips
                                            outlined
                                    >
                                        <template v-slot:no-data>
                                            <v-list-item>
                                                <span class="subheading">tạo thẻ mới </span>
                                                <v-chip

                                                        label
                                                        small
                                                >
                                                    {{ search }}
                                                </v-chip>
                                            </v-list-item>
                                        </template>

                                        <template v-slot:selection="{ attrs, item, parent, selected }">
                                            <v-chip
                                                    v-if="item === Object(item)"
                                                    v-bind="attrs"
                                                    :input-value="selected"
                                                    label
                                                    small
                                            >
                                    <span class="pr-2">
                                        {{ item.text }}
                                    </span>
                                                <v-icon
                                                        small
                                                        @click="parent.selectItem(item)"
                                                >mdi-close</v-icon>
                                            </v-chip>
                                        </template>

                                        <template v-slot:item="{ index, item }">
                                            <v-text-field
                                                v-if="editing === item"
                                                v-model="editing.text"
                                                autofocus
                                                flat
                                                dense
                                                background-color="transparent"
                                                hide-details
                                                solo
                                                @keyup.enter="edit(index, item)"
                                            ></v-text-field>

                                            <v-chip
                                                    v-else
                                                    dark
                                                    label
                                                    small
                                            >
                                                {{ item.text }}
                                            </v-chip>

                                            <v-spacer></v-spacer>
                                            <v-list-item-action @click.stop>
                                                <v-btn
                                                        icon
                                                        @click.stop.prevent="edit(index, item)"
                                                >
                                                    <v-icon>{{ editing !== item ? 'mdi-pencil' : 'mdi-check' }}</v-icon>
                                                </v-btn>

                                            </v-list-item-action>

                                        </template>
                                    </v-combobox>

                                    <div class="d-flex justify-end">
                                        <v-btn :disabled="!formValid" small outlined @click="postQuestion">Đăng câu hỏi</v-btn>

                                        <v-btn class="ml-3" small outlined to="/dien-dan">Quay lại</v-btn>
                                    </div>
                                </div>
                            </v-form>
                        </v-card>
                    </v-stepper-content>
                    <!--
                    <v-stepper-step :complete="step > 2" step="2">Xác nhận</v-stepper-step>
                    <v-stepper-content step="2">
                        <v-card
                            max-width="100%"
                            outlined
                        >
                            <v-list-item>
                                <v-list-item-title class="font-weight-bold subtitle-2">Câu hỏi:</v-list-item-title>
                            </v-list-item>

                            <v-list-item three-line>
                                <v-list-item-content>
                                    <v-list-item-title class=".subtitle-2	 mb-3 text-wrap">
                                        Tôi muốn kinh doanh nhưng không có vốn thì nên bắt đầu từ đâu
                                        Tôi muốn kinh doanh nhưng không có vốn thì nên bắt đầu từ đâu
                                    </v-list-item-title>
                                    <v-list-item-subtitle>
                                        <v-chip
                                                class="ma-1"
                                                color="grey darken-1"
                                                label
                                                text-color="white"
                                                small

                                        >
                                            <v-icon small left>mdi-tag</v-icon>
                                            Khởi nghiệp
                                        </v-chip>

                                        <v-chip
                                                class="ma-1"
                                                color="grey darken-1"
                                                label
                                                text-color="white"
                                                small

                                        >
                                            <v-icon small left>mdi-tag</v-icon>
                                            Kinh tế
                                        </v-chip>
                                    </v-list-item-subtitle>
                                </v-list-item-content>
                            </v-list-item>
                            <VDivider/>

                            <div class="d-flex justify-start ma-4 ">
                                <div class="subtitle-2">
                                    <VIcon>mdi-comment-question</VIcon>
                                    Câu trả lời đề xuất
                                </div>
                            </div>
                            <div class="d-flex justify-start ma-4">
                                <div class="">
                                    <p>Tôi muốn kinh doanh nhưng không có vốn thì nên bắt đầu
                                        từ đâu Tôi muốn kinh doanh nhưng không có vốn thì nên bắt đầu từ đâu</p>
                                </div>
                            </div>
                            <VDivider/>
                            <div class="d-flex justify-end ma-3">
                                <v-btn small outlined @click="continue3" class="mr-2" color="success">Tiếp tục</v-btn>
                                <v-btn small outlined @click="comeback_step1" color="red">Quay lại</v-btn>
                            </div>
                        </v-card>
                    </v-stepper-content>
                    -->


                    <v-stepper-step :complete="step > 2" step="2">Hoàn thành</v-stepper-step>

                    <v-stepper-content step="2">
                        <div class="d-flex justify-center">
                            <v-alert dense outlined type="success">
                                Hoàn thành. Câu hỏi của bạn đã được đăng trên hệ thống
                            </v-alert>

                        </div>
                    </v-stepper-content>
                </v-stepper>


            </v-col>
        </v-row>
    </div>
</template>

<script>
    export default {
        data(){
            return{
                question: '',
                step:1,
                formValid: true,
                activator: null,
                attach: null,
                editing: null,
                index: -1,
                items: [
                    { header: 'Nhập tối thiểu một thẻ tag' },
                ],
                nonce: 1,
                menu: false,
                tags: [],
                x: 0,
                search: null,
                y: 0,
            }
        },
        methods: {
            edit (index, item) 
            {
                if (!this.editing) 
                {
                    this.editing = item
                    this.index = index
                } 
                else 
                {
                    this.editing = null
                    this.index = -1
                }
            },

            filter (item, queryText, itemText) 
            {
                if (item.header) 
                    return false

                const hasValue = val => val != null ? val : ''

                const text = hasValue(itemText)
                const query = hasValue(queryText)

                return text.toString()
                .toLowerCase()
                .indexOf(query.toString().toLowerCase()) > -1
            },

            //==============================================================

            comeback_step1()
            {
               this.step = 1;
            },
            continue3(){
                this.step = 3;
            },

            postQuestion(){

                axios({
                    method: 'post',
                    url: 'api/question/postQuestion',
                    data:{
                        question: this.question,
                        tags: this.tags
                    }
                }).then(response=>{
                    this.step = 2;
                    this.train();
                }).catch(error=>{

                })
            },

            train()
            {
                axios({
                    method: 'post',
                    url: 'api/question/trainQuestion',
                }).then(response=>{

                }).catch(error=>{

                })
            },

            getTags()
            {
                axios({
                    method: 'post',
                    url: 'api/tags/getAll',
                }).then(response=>{
                    let tags = response.data;
                    tags.map((item,index,tags)=>{
                        this.items.push({
                            text: item.name_tag
                        });
                    });

                    console.log(this.items);
                }).catch(error=>{

                })
            }
        },
        mounted(){
            this.getTags();
        },
        watch: {
            tags (val, prev) {
                if (val.length === prev.length) 
                    return

                this.tags = val.map(v =>
                {
                    if (typeof v === 'string')
                    {
                        v = {
                            text: v
                        }

                        this.items.push(v)

                        this.nonce++
                    }

                    return v
                })
            },
        },

    };
</script>

<style scoped>
    
    
</style>