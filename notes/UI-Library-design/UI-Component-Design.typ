#import "../../templates/ams/template.typ": *
#import "../../utils/algorithmic.typ"
#let algorithm = algorithmic.algorithm


#show: ams-article.with(
  title: "UI library design",
  authors: (
    (
      name: "Dicarbene (wxj)",
    ),
  ),
  bibliography-file: "refs.bib",
)

= abstract

== Button

=== props
- content 
- icon
- type
- size
- iconPlacement
- disabled
- loading

=== button types

#algorithm({
  import algorithmic: *
  Function("Binary-Search", args: ("A", "n", "v"), {
    Cmt[Initialize the search range]
    Assign[$l$][$1$]
    Assign[$r$][$n$]
    State[]
    While(cond: $l <= r$, {
      Assign([mid], FnI[floor][$(l + r)/2$])
      If(cond: $A ["mid"] < v$, {
        Assign[$l$][$m + 1$]
      })
      ElsIf(cond: [$A ["mid"] > v$], {
        Assign[$r$][$m - 1$]
      })
      Else({
        Return[$m$]
      })
    })
    Return[*null*]
  })
})

=== source code

```
<template>
    <div class="gt-ui-button" :class="buttonClass">
        <template v-if="type === 'icon'">
            <i v-if="useIconfont" class="gt-uicomponents-iconfont icon" :class="icon"></i>
            <img v-else class="icon-url" :src="icon" alt="">
        </template>
        <span>{{ content }}</span>
    </div>
</template>

<script>
const TYPE_ENUM = ['primary', 'secondary', 'normal', 'outline', 'text'];
const SIZE_ENUM = ['tiny','small','medium','large'];
const ICON_PLACEMENT_ENUM = ['left','right'];
export default {
    name: 'GtUiButton',
    props: {
        content: {
            required: true,
            type: String,
            default: 'default'
        },
        type: {
            required: false,
            validator(value) {
                return Object.values(TYPE_ENUM).includes(value);
            },
            default: 'normal'
        },
        theme: {
            required: false,
            validator(value) {
                return Object.values(THEME_ENUM).includes(value);
            },
            default: 'default'
        },
        size: {
            required: false,
            validator(value) {
                return Object.values(SIZE_ENUM).includes(value);
            },
            type: String,
            default: 'medium'
        },
        iconPlacement: {
            required: false,
            validator(value) {
                return Object.values(SIZE_ENUM).includes(value);
            },
            type: String,
            default: 'left',
        },
        disabled: {
            required: false,
            type: Boolean,
            default: false
        },
        loading: {
            required: false,
            type: Boolean,
            default: false,
        }
    },
    computed: {
        buttonClass() {
            return `gt-ui-button_${this.type} gt-ui-button_${this.type}_${this.theme}`
        },
        useIconfont() {
            return this.icon?.startsWith('icon');
        }
    }
}
</script>
<style lang='less' scoped>
@import "./index.less";
</style>
```