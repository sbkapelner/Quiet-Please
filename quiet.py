import subprocess


class Top:
    def __init__(self, ITERATIONS, SORT, NUM_PROCESES, THRESHOLD):
        self.ITERATIONS = ITERATIONS
        self.SORT = SORT
        self.NUM_PROCESSES = NUM_PROCESES
        self.THRESHOLD = THRESHOLD

    def runTop(self):
        top_cmd = subprocess.run(
            [f"top -l {self.ITERATIONS} -o {self.SORT} -n {self.NUM_PROCESSES}"],
            shell=True,
            stdout=subprocess.PIPE,
        )
        decoded_bytes = top_cmd.stdout.decode().split("\n")

        target_section = len(decoded_bytes) - (self.NUM_PROCESSES + 1)
        start = target_section
        end = target_section + (self.NUM_PROCESSES - 1)

        PID = []
        COMMAND = []
        for i in range(0, self.NUM_PROCESSES):
            row = (f"{decoded_bytes[target_section+i]}").split()
            if float(row[2]) > float(self.THRESHOLD):
                PID.append(row[0])
                COMMAND.append(row[1])
            data = dict.fromkeys(PID, COMMAND[i])

        # print(COMMAND)
        return data
