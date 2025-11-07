#define MAX_ITEMS 10
#define NAME_LEN 24
#define BUF_SIZE 64

typedef struct {
    int id;
    char name[NAME_LEN];
    int qty;
    int used;
} Item;

Item items[MAX_ITEMS];

// Simple string print
void printStr(char *str) {
    register int a7 asm("a7") = 4;
    register char *a0 asm("a0") = str;
    asm volatile("ecall" :: "r"(a7), "r"(a0));
}

// Print integer
void printInt(int num) {
    register int a7 asm("a7") = 1;
    register int a0 asm("a0") = num;
    asm volatile("ecall" :: "r"(a7), "r"(a0));
}

// Read input into buffer
int readStr(char *buf, int len) {
    register int a7 asm("a7") = 63;
    register int a0 asm("a0") = 0;  // stdin
    register char *a1 asm("a1") = buf;
    register int a2 asm("a2") = len;
    asm volatile("ecall" :: "r"(a7), "r"(a0), "r"(a1), "r"(a2));
    return 0;
}

// Convert ASCII string to int
int strToInt(char *buf) {
    int val = 0, i = 0;
    while (buf[i] >= '0' && buf[i] <= '9') {
        val = val * 10 + (buf[i] - '0');
        i++;
    }
    return val;
}

// Remove newline
void removeNewline(char *buf) {
    int i = 0;
    while (buf[i] != '\0') {
        if (buf[i] == '\n') {
            buf[i] = '\0';
            break;
        }
        i++;
    }
}

void addItem() {
    char buf[BUF_SIZE];
    int i;

    // Find empty slot
    for (i = 0; i < MAX_ITEMS; i++) {
        if (!items[i].used) break;
    }
    if (i == MAX_ITEMS) {
        printStr("Inventory full!\n");
        return;
    }

    // ID
    printStr("Enter Item ID: ");
    readStr(buf, BUF_SIZE);
    items[i].id = strToInt(buf);

    // Name
    printStr("Enter Item Name: ");
    readStr(items[i].name, NAME_LEN);
    removeNewline(items[i].name);

    // Qty
    printStr("Enter Quantity: ");
    readStr(buf, BUF_SIZE);
    items[i].qty = strToInt(buf);

    items[i].used = 1;
    printStr("Item added successfully!\n");
}

void removeItem() {
    char buf[BUF_SIZE];
    int id, i;

    printStr("Enter Item ID to remove: ");
    readStr(buf, BUF_SIZE);
    id = strToInt(buf);

    for (i = 0; i < MAX_ITEMS; i++) {
        if (items[i].used && items[i].id == id) {
            items[i].used = 0;
            printStr("Item removed!\n");
            return;
        }
    }
    printStr("Item not found.\n");
}

void searchItem() {
    char buf[BUF_SIZE];
    int id, i;

    printStr("Enter Item ID to search: ");
    readStr(buf, BUF_SIZE);
    id = strToInt(buf);

    for (i = 0; i < MAX_ITEMS; i++) {
        if (items[i].used && items[i].id == id) {
            printStr("Found: ID=");
            printInt(items[i].id);
            printStr(", Name=");
            printStr(items[i].name);
            printStr(", Qty=");
            printInt(items[i].qty);
            printStr("\n");
            return;
        }
    }
    printStr("Item not found.\n");
}

void displayItems() {
    int i, found = 0;
    for (i = 0; i < MAX_ITEMS; i++) {
        if (items[i].used) {
            printStr("ID=");
            printInt(items[i].id);
            printStr(", Name=");
            printStr(items[i].name);
            printStr(", Qty=");
            printInt(items[i].qty);
            printStr("\n");
            found = 1;
        }
    }
    if (!found) printStr("No items in inventory.\n");
}

int main() {
    char buf[BUF_SIZE];
    int choice;

    while (1) {
        printStr("\nInventory Management Menu\n");
        printStr("1) Add Item\n");
        printStr("2) Remove Item\n");
        printStr("3) Search Item\n");
        printStr("4) Display Items\n");
        printStr("5) Exit\n");
        printStr("Select option: ");

        readStr(buf, BUF_SIZE);
        choice = strToInt(buf);

        if (choice == 1) addItem();
        else if (choice == 2) removeItem();
        else if (choice == 3) searchItem();
        else if (choice == 4) displayItems();
        else if (choice == 5) {
            printStr("Exiting...\n");
            register int a7 asm("a7") = 10; // Exit syscall
            asm volatile("ecall" :: "r"(a7));
        }
        else printStr("Invalid choice.\n");
    }
    return 0;
}
