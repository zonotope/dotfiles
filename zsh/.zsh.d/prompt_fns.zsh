#
# Prompt separator
#

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_PROMPT_SEP_SHOW="${SPACESHIP_PROMPT_SEP_SHOW=true}"
SPACESHIP_PROMPT_SEP_PREFIX="${SPACESHIP_PROMPT_SEP_PREFIX=-}"
SPACESHIP_PROMPT_SEP_SUFFIX="${SPACESHIP_PROMPT_SEP_SUFFIX="$NEWLINE"}"
SPACESHIP_PROMPT_SEP_COLOR="${SPACESHIP_PROMPT_SEP_COLOR=white}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

spaceship_prompt_sep() {
    spaceship::section ${SPACESHIP_PROMPT_SEP_COLOR} \
                       ${SPACESHIP_PROMPT_SEP_PREFIX} \
                       "------------------------------------------------------" \
                       ${SPACESHIP_PROMPT_SEP_SUFFIX}
}
