<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style>
$iconColor: #4C515E;
$iconColorActive: #212533;
$textColor: #212533;

.search {
    display: flex;
    align-items: center;
    border-radius: 50%;
    transition: all .3s ease .5s;
    background: #fff;
    box-shadow: 0 3px 14px -1px rgba(#000, .18);
    .icon {
        width: 20px;
        cursor: pointer;
        height: 20px;
        margin: 20px;
        position: relative;
        transform: rotate(90deg) translate(-10%, -10%);
        transition: all .3s ease .6s;
        &:before {
            content: '';
            position: absolute;
            border-radius: 50%;
            border: 2px solid $iconColor;
            left: 0;
            top: 0;
            right: 0;
            bottom: 0;
            display: block;
            transition: all .3s ease 0s;
        }
        span {
            display: block;
            top: 50%;
            left: 50%;
            width: 2px;
            height: 2px;
            border-radius: 1px;
            margin: -1px 0 0 -1px;
            position: absolute;
            transition: background 0s ease 0s;
            &:before,
            &:after {
                content: '';
                top: 0;
                width: 2px;
                height: 2px;
                opacity: 0;
                border-radius: 1px;
                position: absolute;
                background: $iconColorActive;
                transition: all .3s ease 0s;
            }
            &:before {
                right: 0;
            }
            &:after {
                left: 0;
            }
            svg {
                display: block;
                fill: none;
                stroke-linecap: round;
                stroke-width: 5px;
                stroke: $iconColor;
                width: 15px;
                height: 15px;
                position: absolute;
                left: 0;
                top: 0;
                stroke-dasharray: 47;
                stroke-dashoffset: 67;
                transition: all .4s ease .31s, opacity .1s ease .4s, stroke .4s ease .0s;
            }
        }
    }
    .field {
        position: relative;
        width: 0;
        transition: all .5s cubic-bezier(.51, .92, .24, 1.15) .5s;
        input {
            font-size: inherit;
            line-height: inherit;
            padding: 0 24px 0 0;
            border: 0;
            display: block;
            font-family: inherit;
            position: absolute;
            background: #fff;
            -webkit-appearance: none;
            top: 0;
            width: 100%;
            opacity: 0;
            z-index: 1;
            visibility: hidden;
            transition: all 0s ease 0s;
            margin: 0;
            line-height: 22px;
            vertical-align: middle;
            text-transform: none;
            &:focus {
                outline: none;
            }
            &::-webkit-input-placeholder {
                color: $textColor;
            }
            &:-moz-placeholder {
                color: $textColor;
            }
            &::-moz-placeholder {
                color: $textColor;
            }
            &:-ms-input-placeholder {
                color: $textColor;
            }
        }
        & > div {
            white-space: nowrap;
            color: $textColor;
            display: flex;
            span {
                opacity: 0;
                line-height: 22px;
                display: block;
                visibility: hidden;
                transform: translate(0, 12px);
                transition: all .4s ease;
                &:nth-child(1) {
                    transition-delay: .4s;
                }
                &:nth-child(2) {
                    transition-delay: .2s;
                }
                &:nth-child(3) {
                    transition-delay: 0s;
                }
            }
        }
    }
    &.open {
        border-radius: 8px;
        transition-delay: 0s;
        box-shadow: 0 10px 36px -2px rgba(#000, .18);
        .icon {
            transform: rotate(0deg) translate(0, 0);
            transition-delay: 0s;
            &:before {
                border-color: $iconColorActive;
            }
            span {
                svg {
                    stroke: $iconColorActive;
                    transition-delay: 0s;
                }
            }
        }
        .field {
            transition-delay: 0s;
            width: 200px;
            & > div {
                span {
                    opacity: 1;
                    visibility: visible;
                    transform: translate(0, 0);
                    &:nth-child(1) {
                        transition-delay: .4s;
                    }
                    &:nth-child(2) {
                        transition-delay: .45s;
                    }
                    &:nth-child(3) {
                        transition-delay: .50s;
                    }
                }
            }
            input {
                opacity: 1;
                visibility: visible;
                transition-delay: .75s;
            }
        }
    }
    &.loading {
        .icon {
            span {
                background: $iconColorActive;
                animation: rotate 1s infinite ease .8s;
                transition-delay: .4s;
                svg {
                    transition-delay: 0s;
                    stroke-dasharray: 48;
                    stroke-dashoffset: 139;
                    opacity: 0;
                    transition: all .4s ease 0s, opacity 0s ease .4s;
                }
                &:before,
                &:after {
                    opacity: 1;
                    transition-delay: .4s;
                }
                &:before {
                    transform: translate(-4px, 0);
                }
                &:after {
                    transform: translate(4px, 0);
                }
            }
        }
    }
}

@keyframes rotate {
    0% {
        transform: rotate(0deg);
    }
    100% {
        transform: rotate(360deg);
    }
}

html {
    box-sizing: border-box;
    -webkit-font-smoothing: antialiased;
}

* {
    box-sizing: inherit;
    &:before,
    &:after {
        box-sizing: inherit;
    }
}

// Center & dribbble
body {
    min-height: 100vh;
    font-family: Lato, Arial;
    color: #ADAFB6;
    display: flex;
    justify-content: center;
    align-items: center;
    .dribbble {
        position: fixed;
        display: block;
        right: 20px;
        bottom: 20px;
        opacity: .5;
        transition: all .4s ease;
        &:hover {
            opacity: 1;
        }
        img {
            display: block;
            height: 36px;
        }
    }
}
</style>
<body>
<div class="search">
    <div class="icon">
        <span>
            <svg viewBox="0 0 40 40">
                <path d="M3,3 L37,37"></path>
            </svg>
        </span>
    </div>
    <div class="field">
        <input type="text" placeholder="Search for something...">
    </div>
</div>

<!-- dribbble -->
<a class="dribbble" href="https://dribbble.com/shots/4871057-Search-loading-animation" target="_blank"><img src="https://cdn.dribbble.com/assets/dribbble-ball-1col-dnld-e29e0436f93d2f9c430fde5f3da66f94493fdca66351408ab0f96e2ec518ab17.png" alt=""></a>
</body>
<script>
$(document).ready(function() {

    $('.search').each(function() {
        var self = $(this);
        var div = self.children('.field');
        var placeholder = div.children('input').attr('placeholder');
        var placeholderArr = placeholder.split(/ +/);
        if(placeholderArr.length) {
            var spans = $('<div />');
            $.each(placeholderArr, function(index, value) {
                spans.append($('<span />').html(value + '&nbsp;'));
            });
            div.append(spans);
        }
        self.click(function() {
            self.addClass('open');
            setTimeout(function() {
                self.find('input').focus();
                self.find('input').on('keyup', function() {
                    self.toggleClass('loading', (self.find('input').val().toString().length > 3));
                });
            }, 750);
        });
        $(document).click(function(e) {
            if(!$(e.target).is(self) && !jQuery.contains(self[0], e.target)) {
                self.removeClass('open loading');
                setTimeout(function() {
                    self.find('input').val('');
                }, 400);
            }
        });
    });

});
</script>
</html>